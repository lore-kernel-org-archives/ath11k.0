Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBF0f-0005zi-TR
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 10:20:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: return error if firmware request fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200825143040.233619-1-alex.dewar90@gmail.com>
References: <20200825143040.233619-1-alex.dewar90@gmail.com>
Message-Id: <20200827101903.69E95C433A1@smtp.codeaurora.org>
Date: Thu, 27 Aug 2020 10:19:03 +0000 (UTC)
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
To: Alex Dewar <alex.dewar90@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org

Alex Dewar <alex.dewar90@gmail.com> wrote:

> In ath11k_qmi_prepare_bdf_download(), ath11k_core_firmware_request() is
> called, but the returned pointer is not checked for errors. Rather the
> variable ret (which will always be zero) is checked by mistake. Fix
> this and replace the various gotos with simple returns for clarity.
> 
> While we are at it, move the call to memset, as variable bd is not used
> on all code paths.
> 
> Fixes: 7b57b2ddec21 ("ath11k: create a common function to request all firmware files")
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

342b6194a75b ath11k: return error if firmware request fails

-- 
https://patchwork.kernel.org/patch/11735787/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
