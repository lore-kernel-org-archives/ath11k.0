Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD5Pt-0004DM-UI
 for ath11k@lists.infradead.org; Tue, 01 Sep 2020 12:29:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: dont enable bss color collision detection on
 non-transmitting BSS
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200822144048.3961875-1-john@phrozen.org>
References: <20200822144048.3961875-1-john@phrozen.org>
Message-Id: <20200901122935.410FFC433CA@smtp.codeaurora.org>
Date: Tue,  1 Sep 2020 12:29:35 +0000 (UTC)
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

> A none transmitting BSS color collision detection should not be enabled.
> 
> This patch depends on the BSS coloring and multiple bssid series.
> 
> Signed-off-by: John Crispin <john@phrozen.org>

Tested-on missing, on what hardware and firmware did you test this?

-- 
https://patchwork.kernel.org/patch/11731143/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
