Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfUU-0001xu-8U
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 10:50:07 +0000
MIME-Version: 1.0
Subject: Re: [RESEND] ath11k: make sure to also report the RX bandwidth inside
 radiotap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191217202057.27720-1-john@phrozen.org>
References: <20191217202057.27720-1-john@phrozen.org>
Message-Id: <20200126105003.DA331C433A2@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:50:03 +0000 (UTC)
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

> Add IEEE80211_RADIOTAP_HE_DATA1_BW_RU_ALLOC_KNOWN to the list of known
> fields. Not doing so will result in wireshark not calculating the
> bitrate correctly.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

93634c61056e ath11k: make sure to also report the RX bandwidth inside radiotap

-- 
https://patchwork.kernel.org/patch/11298569/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
