Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvSZ-0007fF-Gy
 for ath11k@lists.infradead.org; Thu, 17 Sep 2020 15:04:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: initialize wmi config based on hw_params
References: <480d8984-a5fb-be1b-b553-e01609601059@canonical.com>
Date: Thu, 17 Sep 2020 18:04:16 +0300
In-Reply-To: <480d8984-a5fb-be1b-b553-e01609601059@canonical.com> (Colin Ian
 King's message of "Wed, 19 Aug 2020 12:05:17 +0100")
Message-ID: <875z8ch2bz.fsf@codeaurora.org>
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
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath11k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Colin Ian King <colin.king@canonical.com> writes:

> Hi,
>
> static analysis with Coverity has detected a duplicated assignment issue
> with the following commit:
>
> commit 2d4bcbed5b7d53e19fc158885e7340b464b64507
> Author: Carl Huang <cjhuang@codeaurora.org>
> Date:   Mon Aug 17 13:31:51 2020 +0300
>
>     ath11k: initialize wmi config based on hw_params
>
> The analysis is as follows:
>
>
>  74        config->beacon_tx_offload_max_vdev = 0x2;
>  75        config->num_multicast_filter_entries = 0x20;
>  76        config->num_wow_filters = 0x16;
>
> Unused value (UNUSED_VALUE)
> assigned_value: Assigning value 1U to config->num_keep_alive_pattern
> here, but that stored value is overwritten before it can be used.
>  77        config->num_keep_alive_pattern = 0x1;
>
> value_overwrite: Overwriting previous write to
> config->num_keep_alive_pattern with value 0U.
>
>  78        config->num_keep_alive_pattern = 0;
>
>
> I'm not sure if one of these assignments is redundant, or perhaps one of
> the assignments is meant to be setting a different structure element.

0x1 assignment should be removed, I'll send a patch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
