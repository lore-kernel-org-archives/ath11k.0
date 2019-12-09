Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieP0j-0006DR-LJ
 for ath11k@lists.infradead.org; Mon, 09 Dec 2019 19:48:03 +0000
MIME-Version: 1.0
Date: Mon, 9 Dec 2019 19:47:57 +0000
From: pradeepc@codeaurora.org
Subject: Re: [PATCH V2 8/9] ath11k: optimise ath11k_dp_tx_completion_handler
In-Reply-To: <20191204181745.27297-9-john@phrozen.org>
References: <20191204181745.27297-1-john@phrozen.org>
 <20191204181745.27297-9-john@phrozen.org>
Message-ID: <0101016eec343e4e-d418e0ca-212a-426b-bf3d-35fe51d15073-000000@us-west-2.amazonses.com>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>


> @@ -828,10 +827,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
>  			     ath11k_dp_tx_pending_cleanup, ab);
>  		idr_destroy(&dp->tx_ring[i].txbuf_idr);
>  		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
> -
> -		spin_lock_bh(&dp->tx_ring[i].tx_status_lock);
> -		kfifo_free(&dp->tx_ring[i].tx_status_fifo);
> -		spin_unlock_bh(&dp->tx_ring[i].tx_status_lock);
> +		kfree(&dp->tx_ring[i].tx_status);
>  	}
"kfree(&dp->tx_ring[i].tx_status)"  --> 
"kfree(dp->tx_ring[i].tx_status)"

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
