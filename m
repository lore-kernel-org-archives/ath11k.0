Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMXD-00050Z-65
 for ath11k@lists.infradead.org; Tue, 28 Apr 2020 09:28:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath11k: remove redundant dev_err call in
 ath11k_ahb_probe()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200427104403.14598-1-weiyongjun1@huawei.com>
References: <20200427104403.14598-1-weiyongjun1@huawei.com>
Message-Id: <20200428092801.4222DC432C2@smtp.codeaurora.org>
Date: Tue, 28 Apr 2020 09:28:01 +0000 (UTC)
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
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I don't see harm having two error messages and having an error message
within ath11k makes it easier to find the exact location, so I'm
dropping this.

-- 
https://patchwork.kernel.org/patch/11511845/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
