Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIwBp-000879-30
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 14:14:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: move per peer pktlog entry to per sta debugfs
References: <1555389673-19625-1-git-send-email-akolli@codeaurora.org>
Date: Tue, 23 Apr 2019 17:14:24 +0300
In-Reply-To: <1555389673-19625-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Tue, 16 Apr 2019 10:11:13 +0530")
Message-ID: <871s1szu4f.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> Per peer pktlog is enabled through per sta debugfs
> Currently this feature is limited on single peer.
>
> Enable pktlog using,
> echo "0x6f 2" > /sys/kernel/debug/ath11k/mac0/pktlog_filter
>
> Enable peer pktlog using,
> echo 1 > /sys/kernel/debug/ieee80211/phy9/netdev\:wlan0/stations
> /8c\:fd\:f0\:0a\:8c\:14/peer_pktlog
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Does not compile:

drivers/net/wireless/ath/ath11k/debugfs_sta.c:455:11: error: initialization of 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
  .write = ath11k_dbg_sta_write_peer_pktlog,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
