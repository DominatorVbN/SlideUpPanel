//
//  CardViewController.swift
//  CardViewAnimation
//
//  Created by Brian Advent on 26.10.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
enum CardState {
    case expanded
    case collapsed
}
public class CardViewController: UIViewController {

    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var contentAreaView: UIView!
    public var visualEffectView:UIVisualEffectView!
    
    let cardHeight:CGFloat = 600
    let cardHandleAreaHeight:CGFloat = 65
    public var vc : UIViewController!
    public var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    public var runningAnimations = [UIViewPropertyAnimator]()
    public var animationProgressWhenInterrupted:CGFloat = 0
    public init(frame:CGRect,vc:UIViewController) {
        super.init(nibName: "CardViewController", bundle:  Bundle(for:CardViewController.self))
        self.vc = vc
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: "CardViewController", bundle:  Bundle(for:CardViewController.self))
    }
    public func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = vc.view.frame
        vc.view.addSubview(visualEffectView)
        vc.addChild(self)
        vc.view.addSubview(self.view)
        self.view.frame = CGRect(x: 0, y: vc.view.frame.height - cardHandleAreaHeight, width: vc.view.bounds.width, height: cardHeight)
        
        self.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CardViewController.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(CardViewController.handleCardPan(recognizer:)))
        
        self.handleArea.addGestureRecognizer(tapGestureRecognizer)
        self.handleArea.addGestureRecognizer(panGestureRecognizer)
        
        
    }
    public func setupCard(with vc2: UIViewController)
    {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = vc.view.frame
        vc.view.addSubview(visualEffectView)
        vc.addChild(self)
        vc.view.addSubview(self.view)
        self.view.frame = CGRect(x: 0, y: vc.view.frame.height - cardHandleAreaHeight, width: vc.view.bounds.width, height: cardHeight)
        
        self.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CardViewController.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(CardViewController.handleCardPan(recognizer:)))
        
        self.handleArea.addGestureRecognizer(tapGestureRecognizer)
        self.handleArea.addGestureRecognizer(panGestureRecognizer)
        self.addChild(vc2)
        self.contentAreaView.addSubview(vc2.view)
        let frame = CGRect(x: self.contentAreaView.frame.minX, y: self.contentAreaView.frame.minY - 65, width: self.contentAreaView.frame.width, height: self.contentAreaView.frame.height)
        vc2.view.frame = frame
        
    }
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan (recognizer:UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.handleArea)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.view.frame.origin.y = self.vc.view.frame.height - self.cardHeight
                    
                case .collapsed:
                    self.view.frame.origin.y = self.vc.view.frame.height - self.cardHandleAreaHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.view.layer.cornerRadius = 12
                case .collapsed:
                    self.view.layer.cornerRadius = 0
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
            
        }
    }
    
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    public func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
}
