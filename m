Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Mon, 27 Jul 2020 12:49:42 -0700 (PDT)
Message-Id: <20200727.124942.1829978531845134184.davem@davemloft.net>
Subject: Re: [PATCH] soc: qmi: allow user to set handle wq to hiprio
From: David Miller <davem@davemloft.net>
In-Reply-To: <AMoAtwB9DXJsyd-1khUpzqq9.1.1595862196133.Hmail.wenhu.wang@vivo.com>
References: <AMoAtwB9DXJsyd-1khUpzqq9.1.1595862196133.Hmail.wenhu.wang@vivo.com>
Mime-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: wenhu.wang@vivo.com
Cc: ohad@wizery.com, linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org, elder@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org, sibis@codeaurora.org, netdev@vger.kernel.org, kuba@kernel.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

From: 王文虎 <wenhu.wang@vivo.com>
Date: Mon, 27 Jul 2020 23:03:16 +0800 (GMT+08:00)

> Currently the qmi_handle is initialized single threaded and strictly
> ordered with the active set to 1. This is pretty simple and safe but
> sometimes ineffency. So it is better to allow user to decide whether
> a high priority workqueue should be used.
> 
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>

Every caller sets the new value to "0", so you should submit this when
you have a cast that actually sets it to "1".

Also, the new argument should be "bool" instead of "unsigned int" and
use "true" and "false" in the callers.

Thank you.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
