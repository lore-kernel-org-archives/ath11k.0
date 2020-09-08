Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWnC-0000Cy-BS
 for ath11k@lists.infradead.org; Tue, 08 Sep 2020 06:07:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V6 2/2] ath11k: add support for setting fixed HE
 rate/gi/ltf
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200804081630.2013619-2-john@phrozen.org>
References: <20200804081630.2013619-2-john@phrozen.org>
Message-ID: <010101746c53c348-062d5416-71ef-4327-b791-8d5f3d047d13-000000@us-west-2.amazonses.com>
Date: Tue, 8 Sep 2020 06:07:43 +0000
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
Cc: Miles Hu <milehu@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> From: Miles Hu <milehu@codeaurora.org>
> 
> This patch adds ath11k support for setting fixed HE rate/gi/ltf values that
> we are now able to send to the kernel using nl80211. The added code is
> reusing parts of the existing code path already used for HT/VHT. The new
> helpers are symmetric to how we do it for HT/VHT.
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>

Depends on:

eb89a6a6b7a1 nl80211: add support for setting fixed HE rate/gi/ltf

Currently in net-next.

-- 
https://patchwork.kernel.org/patch/11699949/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
