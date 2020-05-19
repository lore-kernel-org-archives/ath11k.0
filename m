Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jawAY-00074n-7O
 for ath11k@lists.infradead.org; Tue, 19 May 2020 06:56:08 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix some resource leaks in error path in
 'ath11k_thermal_register()'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200513201454.258111-1-christophe.jaillet@wanadoo.fr>
References: <20200513201454.258111-1-christophe.jaillet@wanadoo.fr>
Message-Id: <20200519065600.A096AC43636@smtp.codeaurora.org>
Date: Tue, 19 May 2020 06:56:00 +0000 (UTC)
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
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, pradeepc@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, davem@davemloft.net

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If 'thermal_cooling_device_register()' fails, we must undo what has been
> allocated so far. So we must go to 'err_thermal_destroy' instead of
> returning directly
> 
> In case of error in 'ath11k_thermal_register()', the previous
> 'thermal_cooling_device_register()' call must also be undone. Move the
> 'ar->thermal.cdev = cdev' a few lines above in order for this to be done
> in 'ath11k_thermal_unregister()' which is called in the error handling
> path.
> 
> Fixes: 2a63bbca06b2 ("ath11k: add thermal cooling device support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

25ca180ad380 ath11k: Fix some resource leaks in error path in 'ath11k_thermal_register()'

-- 
https://patchwork.kernel.org/patch/11547195/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
