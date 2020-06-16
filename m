Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl7G4-0002O3-C1
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 08:47:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/8] ath11k: update firmware files read path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591709581-18039-3-git-send-email-akolli@codeaurora.org>
References: <1591709581-18039-3-git-send-email-akolli@codeaurora.org>
Message-Id: <20200616084742.F2C15C433C9@smtp.codeaurora.org>
Date: Tue, 16 Jun 2020 08:47:42 +0000 (UTC)
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> We need this so that all hardware versions can coexist and
> it's easier to manage everything then all hardware
> directories are under ath11k directory.
> 
> Copy ath11k firmware files to
> /lib/firmware/ath11k/IPQ8074/hw2.0/
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7309f7730532 ath11k: update firmware files read path

-- 
https://patchwork.kernel.org/patch/11595655/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
