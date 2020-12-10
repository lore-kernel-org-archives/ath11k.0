Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCIg-00011C-E4
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 03:07:27 +0000
Received: by mail-pf1-x431.google.com with SMTP id c79so2697830pfc.2
 for <ath11k@lists.infradead.org>; Wed, 09 Dec 2020 19:07:24 -0800 (PST)
MIME-Version: 1.0
References: <CAE+mCOEX5ccBa2HBYpi_3YpayApyr-C1csBpvvjWZ-hnW38Oqw@mail.gmail.com>
 <87v9db9ftj.fsf@codeaurora.org>
In-Reply-To: <87v9db9ftj.fsf@codeaurora.org>
From: Stephen Liang <stephenliang7@gmail.com>
Date: Wed, 9 Dec 2020 19:07:11 -0800
Message-ID: <CAE+mCOEZed9Wa8CxHv9dkuyB_-5YukjNPLQTjXv4pK8fc1ev6Q@mail.gmail.com>
Subject: Re: ath11k: QCA6390 on Dell XPS 13 and kernel crashes
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

> Thanks, good to know. On what platform is this, can you share more details? Is it the new Dell XPS 13 9310 or something else?

Yes, this is the XPS 13 9310.

> I recommend using ath11k-qca6390-bringup branch, it has quite a few
fixes:

Let me give that a shot, perhaps if I can reproduce the same issues
the others have been seeing I could start a bisect as well.

My uptime is now at 2 days with Fedora Rawhide kernel 5.10.0-0.rc6
with commit 59c6d022df8efb450f82d33dd6a6812935bd022f and a revert of
7fef431be9c9 patched in. I'm not experiencing any of the stalls or
crashes that others have been mentioning and I have been able to
suspend/resume consistently. No issues with power being plugged and
unplugged either. Happy to help provide details if anybody needs any.

> You mean that the reboot stalls and you need to turn off the laptop using power button?

Actually, with the previously mentioned commit combination, I was able
to shutdown and reboot successfully as well.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
