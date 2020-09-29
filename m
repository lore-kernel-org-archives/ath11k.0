Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNB3D-0002uz-J9
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 08:31:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Move non-fatal warn logs to dbg level
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600948691-6901-1-git-send-email-govinds@codeaurora.org>
References: <1600948691-6901-1-git-send-email-govinds@codeaurora.org>
Message-Id: <20200929083153.73B76C433FF@smtp.codeaurora.org>
Date: Tue, 29 Sep 2020 08:31:53 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> During driver load below warn logs are printed in the console.
> Since driver may not implement all wmi events sent by fw and
> all of them are non-fatal, move this log to debug level to
> remove un-necessary warn message on console.
> 
> [876.898735] ath11k_pci 0000:06:00.0: Unknown eventid: 0x16005
> [879.283250] ath11k_pci 0000:06:00.0: Unknown eventid: 0x1d00a
> 
> No functional changes. Compile tested only.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

82b4f9b857e7 ath11k: Move non-fatal warn logs to dbg level

-- 
https://patchwork.kernel.org/patch/11797129/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
