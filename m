Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEDpp-0003JC-0v
 for ath11k@lists.infradead.org; Wed, 10 Apr 2019 14:04:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:ath11k-bringup 66/93]
 drivers/net/wireless/ath/ath11k/core.c:722:2-8: preceding lock on line 718
 (fwd)
References: <alpine.DEB.2.21.1904100817290.2799@hadrien>
Date: Wed, 10 Apr 2019 17:04:09 +0300
In-Reply-To: <alpine.DEB.2.21.1904100817290.2799@hadrien> (Julia Lawall's
 message of "Wed, 10 Apr 2019 08:18:18 +0200 (CEST)")
Message-ID: <878swinehy.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath11k@lists.infradead.org, kbuild-all@01.org

(moving the thread from ath10k to ath11k list, full copy below)

Julia Lawall <julia.lawall@lip6.fr> writes:

> An unlock seems to be missing on line 722.
>
> julia
>
> ---------- Forwarded message ----------
> Date: Wed, 10 Apr 2019 13:54:47 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild@01.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Subject: [ath6kl:ath11k-bringup 66/93]
>     drivers/net/wireless/ath/ath11k/core.c:722:2-8: preceding lock on line 718
>
> CC: kbuild-all@01.org
> CC: ath10k@lists.infradead.org
> TO: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> CC: Kalle Valo <kvalo@codeaurora.org>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
> head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
> commit: 3a7b4838b6f6f234239f263ef3dc02e612a083ad [66/93] ath11k: Add
> support for subsystem recovery
> :::::: branch date: 15 hours ago
> :::::: commit date: 8 days ago
>
>>> drivers/net/wireless/ath/ath11k/core.c:722:2-8: preceding lock on line 718
>
> #
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=3a7b4838b6f6f234239f263ef3dc02e612a083ad
> git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> git remote update ath6kl
> git checkout 3a7b4838b6f6f234239f263ef3dc02e612a083ad
> vim +722 drivers/net/wireless/ath/ath11k/core.c
>
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  682
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 683 static void
> ath11k_core_restart(struct work_struct *work)
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  684  {
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 685 struct ath11k_base *sc
> = container_of(work, struct ath11k_base, restart_work);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  686  	struct ath11k *ar;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  687  	struct ath11k_pdev *pdev;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  688  	int i, ret = 0;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  689
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  690  	spin_lock_bh(&sc->data_lock);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  691  	sc->stats.fw_crash_counter++;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 692
> spin_unlock_bh(&sc->data_lock);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  693
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 694 for (i = 0; i <
> sc->num_radios; i++) {
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  695  		pdev = &sc->pdevs[i];
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  696  		ar = pdev->ar;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 697 if (!ar || ar->state ==
> ATH11K_STATE_OFF)
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  698  			continue;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  699
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 700
> ieee80211_stop_queues(ar->hw);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  701  		ath11k_drain_tx(ar);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 702
> complete(&ar->scan.started);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 703
> complete(&ar->scan.completed);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 704
> complete(&ar->peer_assoc_done);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 705
> complete(&ar->install_key_done);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 706
> complete(&ar->vdev_setup_done);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 707
> complete(&ar->bss_survey_done);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  708
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 709
> wake_up(&ar->dp.tx_empty_waitq);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 710
> idr_for_each(&ar->txmgmt_idr,
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 711
> ath11k_mac_tx_mgmt_pending_free, ar);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 712
> idr_destroy(&ar->txmgmt_idr);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  713  	}
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  714
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 715
> wake_up(&sc->wmi_sc.tx_credits_wq);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  716  	wake_up(&sc->peer_mapping_wq);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  717
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 @718  	mutex_lock(&sc->core_lock);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 719 ret =
> ath11k_core_reconfigure_on_crash(sc);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  720  	if (ret) {
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 721 ath11k_err(sc, "failed
> to reconfigure driver on crash recovery\n");
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 @722  		return;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  723  	}
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  724  	mutex_unlock(&sc->core_lock);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  725
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 726 for (i = 0; i <
> sc->num_radios; i++) {
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  727  		pdev = &sc->pdevs[i];
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  728  		ar = pdev->ar;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 729 if (!ar || ar->state ==
> ATH11K_STATE_OFF)
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  730  			continue;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  731
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 732
> mutex_lock(&ar->conf_mutex);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  733
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  734  		switch (ar->state) {
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  735  		case ATH11K_STATE_ON:
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 736 ar->state =
> ATH11K_STATE_RESTARTING;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 737 ath11k_core_halt(ar);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 738
> ieee80211_restart_hw(ar->hw);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  739  			break;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  740  		case ATH11K_STATE_OFF:
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 741 ath11k_warn(sc, "cannot
> restart radio %d "
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 742 "that hasn't been
> started\n", i);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  743  			break;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 744 case
> ATH11K_STATE_RESTARTING:
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  745  			break;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 746 case
> ATH11K_STATE_RESTARTED:
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 747 ar->state =
> ATH11K_STATE_WEDGED;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 748 case
> ATH11K_STATE_WEDGED:
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 749 ath11k_warn(sc,
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 750 "device is wedged, will
> not restart radio %d\n", i);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  751  			break;
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  752  		}
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 753
> mutex_unlock(&ar->conf_mutex);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  754  	}
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21 755
> complete(&sc->driver_recovery);
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  756  }
> 3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  757
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
