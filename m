Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO4Ks-00043O-Jr
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 19:33:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] ath11k: read and write registers below unwindowed
 address
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1601544890-13450-2-git-send-email-kvalo@codeaurora.org>
References: <1601544890-13450-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20201001193350.3FA29C433F1@smtp.codeaurora.org>
Date: Thu,  1 Oct 2020 19:33:50 +0000 (UTC)
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

> For QCA6390, host can read and write registers below unwindowed
> address directly without programming the window register. For
> registers below bar0 + 4k - 32, host can read and write regardless
> of the power save state. Shadow registers are located below
> bar0 + 4K - 32.
> 
> Before MHI power up, there is no need to wakeup MHI so ini_done is
> added to indicate it.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

8 patches applied to ath-next branch of ath.git, thanks.

a05bd8513335 ath11k: read and write registers below unwindowed address
e838c14a9ee1 ath11k: enable shadow register configuration and access
9df6d8399d67 ath11k: set WMI pipe credit to 1 for QCA6390
8ec5a6ab9c7e ath11k: start a timer to update TCL HP
506e7e9bbf3f ath11k: start a timer to update REO cmd ring
9b309970c4ea ath11k: start a timer to update HP for CE pipe 4
c83c500b55b6 ath11k: enable idle power save mode
404f5de2f997 ath11k: remove unnecessary casts to u32

-- 
https://patchwork.kernel.org/patch/11811243/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
