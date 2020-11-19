Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfgIC-00080q-Kg
 for ath11k@lists.infradead.org; Thu, 19 Nov 2020 09:31:58 +0000
From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 4/6] ath11k: make relay callbacks const
In-Reply-To: <20201118165320.26829-4-jani.nikula@intel.com>
References: <20201118165320.26829-1-jani.nikula@intel.com>
 <20201118165320.26829-4-jani.nikula@intel.com>
Date: Thu, 19 Nov 2020 11:31:43 +0200
Message-ID: <871rgppu9s.fsf@intel.com>
MIME-Version: 1.0
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
To: linux-kernel@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Wed, 18 Nov 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> Now that relay_open() accepts const callbacks, make relay callbacks
> const.
>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: ath11k@lists.infradead.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Kalle, thanks for the acks on the other two ath patches - can I have
your ack on this one too please?

BR,
Jani.

> ---
>  drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
> index ac2a8cfdc1c0..1afe67759659 100644
> --- a/drivers/net/wireless/ath/ath11k/spectral.c
> +++ b/drivers/net/wireless/ath/ath11k/spectral.c
> @@ -148,7 +148,7 @@ static int remove_buf_file_handler(struct dentry *dentry)
>  	return 0;
>  }
>  
> -static struct rchan_callbacks rfs_scan_cb = {
> +static const struct rchan_callbacks rfs_scan_cb = {
>  	.create_buf_file = create_buf_file_handler,
>  	.remove_buf_file = remove_buf_file_handler,
>  };

-- 
Jani Nikula, Intel Open Source Graphics Center

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
