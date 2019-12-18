Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihXYi-0002Xf-Ot
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 11:32:06 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 6/9] ath11k: add debugfs for TWT debug calls
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213153839.12372-7-john@phrozen.org>
References: <20191213153839.12372-7-john@phrozen.org>
Message-Id: <20191218113202.30A09C433A2@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 11:32:02 +0000 (UTC)
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

> These new debugfs files allow us to manually add/del/pause/resume TWT
> dialogs for test/debug purposes.
> 
> The debugfs files expect the following parameters
> add_dialog	- mac dialog_id wake_intvl_us wake_intvl_mantis
> 		  wake_dura_us sp_offset_us twt_cmd flag_bcast
> 		  flag_trigger flag_flow_type flag_protection
> del_dialog	- mac dialog_id
> pause_dialog	- mac dialog_id
> resume_dialog	- mac dialog_id sp_offset_us next_twt_size
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This added a new warning, fixed in pending branch:

drivers/net/wireless/ath/ath11k/debug.c:123: quoted string split across lines

-- 
https://patchwork.kernel.org/patch/11290751/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
