Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn176-000250-I7
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 15:10:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: QCA6390 on Dell XPS 13 and kernel crashes
In-Reply-To: <CAE+mCOEX5ccBa2HBYpi_3YpayApyr-C1csBpvvjWZ-hnW38Oqw@mail.gmail.com>
 (Stephen Liang's message of "Wed, 2 Dec 2020 15:49:39 -0800")
References: <CAE+mCOEX5ccBa2HBYpi_3YpayApyr-C1csBpvvjWZ-hnW38Oqw@mail.gmail.com>
Date: Wed, 09 Dec 2020 17:09:28 +0200
Message-ID: <87v9db9ftj.fsf@codeaurora.org>
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
To: Stephen Liang <stephenliang7@gmail.com>
Cc: ath11k@lists.infradead.org

Stephen Liang <stephenliang7@gmail.com> writes:

> For reference, I am running Fedora Rawhide kernel 5.10.0-0.rc6 with
> commit 59c6d022df8efb450f82d33dd6a6812935bd022f and a revert of
> 7fef431be9c9 patched in.
>
> I am able to connect to WiFi and did not receive any immediate
> freezing, hard kernel panics, etc. Uptime is now going on 35 minutes
> and able to get 50 up/down throughput.

Thanks, good to know. On what platform is this, can you share more
details? Is it the new Dell XPS 13 9310 or something else?

> I  do see a number of taints in dmesg while connecting to an access
> point but the taint doesn't seem to affect functionality, for example:
> https://pastebin.com/raw/gbzuvs3q

This commit should fix that:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath11k-qca6390-bringup&id=fa4eea695afb286ae38beb30dabf251335cb4a62

I recommend using ath11k-qca6390-bringup branch, it has quite a few
fixes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-qca6390-bringup

> Finally, rebooting the computer does require a hard power down.

You mean that the reboot stalls and you need to turn off the laptop
using power button?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
