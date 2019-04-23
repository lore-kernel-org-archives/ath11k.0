Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIwzx-00053h-GX
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 15:06:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: patchwork
References: <bd15fd3e-a0fb-02b1-05d8-8df1bb3902a2@phrozen.org>
 <87sgu8ye5e.fsf@kamboji.qca.qualcomm.com>
 <8bbbba815f608165a87c10f532e3d3c5aa9f2a1f.camel@ozlabs.org>
Date: Tue, 23 Apr 2019 18:06:13 +0300
In-Reply-To: <8bbbba815f608165a87c10f532e3d3c5aa9f2a1f.camel@ozlabs.org>
 (Jeremy Kerr's message of "Tue, 23 Apr 2019 22:49:13 +0800")
Message-ID: <87lg00yd5m.fsf@kamboji.qca.qualcomm.com>
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
To: Jeremy Kerr <jk@ozlabs.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Jeremy Kerr <jk@ozlabs.org> writes:

> Hi John and Kalle,
>
>> > could you kindly setup a patchwork for the ath11k list ?
>> 
>> I already requested kernel.org admins to setup one but I have not
>> heard
>> back yet.
>
> I'm happy to do so for ozlabs.org, but don't want to duplicate with a
> kernel.org setup. Let me know what you want to do here.

As I already use patchwork.kernel.org with wireless-drivers patches, and
use a custom patchwork script[1], I would prefer to use
patchwork.kernel.org also with ath11k. For example, in case there are
API incompatibilities etc.

> If you do want to go ahead, just let me know what name you want to use
> for the instance ("ath11k development"?), and the patchwork usernames of
> those you want to assign as maintainers.

What if we'll wait for kernel.org admins for a week or so still (I sent
the request on April 13th, I'll ping them) and if I don't hear back,
maybe then you could add it to ozlabs? I'll let you know how it goes.

And BTW thanks for implementing patchwork, it's just awesome! I use it
daily, makes my life so much easier :)

[1] https://github.com/kvalo/pwcli

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
