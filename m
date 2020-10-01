Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO4Jj-00043O-5q
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 19:32:42 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] ath11k: add packet log support for QCA6390
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1601463073-12106-2-git-send-email-kvalo@codeaurora.org>
References: <1601463073-12106-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20201001193238.3C384C433FE@smtp.codeaurora.org>
Date: Thu,  1 Oct 2020 19:32:38 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Add packet log support for QCA6390, otherwise the data connection will stall
> within a minute or so.  Enable it via debugfs and use trace-cmd to capture the
> pktlogs.
> 
> echo 0xffff 1 > /sys/kernel/debug/ath11k/qca6390\ hw2.0/mac0/pktlog_filter
> 
> The mon status ring doesn't support interrupt so far, so host starts
> a timer to reap this ring. The timer handler also reaps the
> rxdma_err_dst_ring in case of monitor mode.
> 
> As QCA6390 requires bss created ahead of starting vdev, so check
> vdev_start_delay for monitor mode.
> 
> For QCA6390, it uses wbm_desc_rel_ring to return descriptors.
> It also uses rx_refill_buf_ring to fill mon buffer instead of
> rxdma_mon_buf_ring.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

5 patches applied to ath-next branch of ath.git, thanks.

701e48a43e15 ath11k: add packet log support for QCA6390
6fbd8898b301 ath11k: pci: fix rmmod crash
7fd85517c359 ath11k: mac: remove unused conf_mutex to solve a deadlock
2f588660e34a ath11k: fix warning caused by lockdep_assert_held
089ba909f8d7 ath11k: debugfs: fix crash during rmmod

-- 
https://patchwork.kernel.org/patch/11808825/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
