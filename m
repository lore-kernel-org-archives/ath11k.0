Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihd7n-0001hC-Od
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:28:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 1/9] ath11k: add wmi helper for turning STA PS on/off
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213153839.12372-2-john@phrozen.org>
References: <20191213153839.12372-2-john@phrozen.org>
Message-Id: <20191218172834.2C44CC447A0@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:28:34 +0000 (UTC)
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> Add a WMI call helper to set the powersave mode of a STA interface.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

97c63746ebb9 ath11k: add wmi helper for turning STA PS on/off
6bfebd4bf939 ath11k: disable PS for STA interfaces by default upon bringup
bde4d95e92d5 ath11k: drop memset when setting up a tx cmd desc
6bc9d6f786a5 ath11k: rename ath11k_wmi_base instances from wmi_sc to wmi_ab

-- 
https://patchwork.kernel.org/patch/11290741/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
