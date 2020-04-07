Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLoTr-00049g-T9
 for ath11k@lists.infradead.org; Tue, 07 Apr 2020 13:41:33 +0000
Date: Tue, 7 Apr 2020 16:41:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath11k: handle RX fragments
Message-ID: <20200407134115.GA108129@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
To: mpubbise@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Hello Manikanta Pubbisetty,

The patch 243874c64c81: "ath11k: handle RX fragments" from Mar 16,
2020, leads to the following static checker warning:

	drivers/net/wireless/ath/ath11k/dp_rx.c:3365 ath11k_dp_rx_frag_h_mpdu()
	warn: missing error code here? 'ath11k_dp_rx_h_defrag()' failed. 'ret' = '0'

drivers/net/wireless/ath/ath11k/dp_rx.c
  3343                                                HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
  3344          }
  3345  
  3346          if (!rx_tid->last_frag_no ||
  3347              rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
  3348                  mod_timer(&rx_tid->frag_timer, jiffies +
  3349                                                 ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS);
  3350                  goto out_unlock;
                        ^^^^^^^^^^^^^^^

All these gotos should probably set error codes instead of returning
success.

  3351          }
  3352  
  3353          spin_unlock_bh(&ab->base_lock);
  3354          del_timer_sync(&rx_tid->frag_timer);
  3355          spin_lock_bh(&ab->base_lock);
  3356  
  3357          peer = ath11k_peer_find_by_id(ab, peer_id);
  3358          if (!peer)
  3359                  goto err_frags_cleanup;
                        ^^^^^^^^^^^^^^^^^^^^^^
Etc.

  3360  
  3361          if (!ath11k_dp_rx_h_defrag_validate_incr_pn(ar, rx_tid))
  3362                  goto err_frags_cleanup;
  3363  
  3364          if (ath11k_dp_rx_h_defrag(ar, peer, rx_tid, &defrag_skb))
  3365                  goto err_frags_cleanup;
  3366  
  3367          if (!defrag_skb)
  3368                  goto err_frags_cleanup;
  3369  
  3370          if (ath11k_dp_rx_h_defrag_reo_reinject(ar, rx_tid, defrag_skb))
  3371                  goto err_frags_cleanup;
  3372  
  3373          ath11k_dp_rx_frags_cleanup(rx_tid, false);
  3374          goto out_unlock;
  3375  
  3376  err_frags_cleanup:
  3377          dev_kfree_skb_any(defrag_skb);
  3378          ath11k_dp_rx_frags_cleanup(rx_tid, true);
  3379  out_unlock:
  3380          spin_unlock_bh(&ab->base_lock);
  3381          return ret;
  3382  }

regards,
dan carpenter

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
