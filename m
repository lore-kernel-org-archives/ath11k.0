Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegDl-0007IP-UY
 for ath11k@lists.infradead.org; Fri, 29 May 2020 14:42:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: add 802.3 undecap support to fix TKIP MIC
 error reporting
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1587720951-9222-3-git-send-email-murugana@codeaurora.org>
References: <1587720951-9222-3-git-send-email-murugana@codeaurora.org>
Message-Id: <20200529144243.5671CC433C9@smtp.codeaurora.org>
Date: Fri, 29 May 2020 14:42:43 +0000 (UTC)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> wrote:

> Currently DECAP_TYPE_8023 frames with TKIP MIC error is not undecaped
> and hence fails to do TKIP MIC error reporting in ieee80211_rx_napi()
> path.
> 
> Fix this by adding undecap support for ieee80211_rx_napi() to process
> these frames and perform TKIP counter-measures when there is MIC error
> reported.
> 
> Tested with STA triggering TKIP MIC error frames (using debugfs
> "tkip_mic_test" in SW encryption mode) twice within a minute and
> verify TKIP counter-measures are performed as expected.
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>

Dropping this patch as the mac80211 patch was dropped.

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11507411/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
