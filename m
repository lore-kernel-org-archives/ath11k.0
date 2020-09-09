Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFtvH-0007GO-Jh
 for ath11k@lists.infradead.org; Wed, 09 Sep 2020 06:49:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath11k: fix uninitialized return in
 ath11k_spectral_process_data()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200619142922.GA267142@mwanda>
References: <20200619142922.GA267142@mwanda>
Message-ID: <0101017471a0793c-f633a815-c23b-48d8-b3d0-3161dddc81a9-000000@us-west-2.amazonses.com>
Date: Wed, 9 Sep 2020 06:49:36 +0000
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, kernel-janitors@vger.kernel.org, Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a success path where "ret" isn't initialized where we never
> have a ATH11K_SPECTRAL_TAG_SCAN_SEARCH and then ret isn't initialized.
> 
> Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c7187acc3cd0 ath11k: fix uninitialized return in ath11k_spectral_process_data()

-- 
https://patchwork.kernel.org/patch/11614313/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
