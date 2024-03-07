Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15535C54798
	for <ath11k@archiver.kernel.org>; Thu,  7 Mar 2024 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8Lo61HZVMQ6CigBjAy14gesjPzmknIZL6TU+MMbkpw=; b=L9wWppAGctJ2V49n+g46e2wWvp
	+cQuYRG1zvieOUS69LlZqZbVI0br8zL2kJuoCtc6EavAJgc7+s0AnF63nEkrLozmsZYvPAXKO2ehZ
	W3qpHD6B0FzABogoAIbz03iJfaX3lqerKR0yGbkQz7I/yj4YpXsgPKSDv9XssgdKf3WSUuFl97kFd
	pJKXLdytLpMgNoH03jqkfuqlz7NzEGER0lcNbLrA3bTuqaYx3WarNaVq9o+Y5g0zQf2/IYl5gAqME
	IKNr1B5pUGF+B8vYNy2WKFgSKj5RW7BjgS9Q66rT1OfJplxZKulgHswwQjrM5i/1iDb1BN7YI9UI5
	Ed60DhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGvv-00000005Ynl-2oOl;
	Thu, 07 Mar 2024 16:49:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGvr-00000005Yle-43Lb;
	Thu, 07 Mar 2024 16:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B533CE254A;
	Thu,  7 Mar 2024 16:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D59C433C7;
	Thu,  7 Mar 2024 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709830160;
	bh=J8Lo61HZVMQ6CigBjAy14gesjPzmknIZL6TU+MMbkpw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QYW62JPtlbjaNdp4ECVGkJ/R92sB1uYgsw8YtSqqtPIJrWWTUaMqgncYU/Xcl6Qdg
	 q+E/YTP/niZh8PQ1bUfa7C6an+ZyBBrN5PGeCI4kRH6Z9Ty4wCgq5ZKNwuAdYWoViL
	 smamuVhAYvccYBlzg7i3lHddO+H58gtyQDdn1YAYj/SecSDIeY9nfJP1bDdHO3w0Ot
	 AbvBGodNKr7HF32lbSxWqke+CP+hPrZ2NgAA+AUk/8PrPZWuZ76ALE6hNbQSwMoZ+f
	 4FCXjB/MqZH3wobQLrtwuZ8IhbN+CVpDnMIZCQBj5664IZRVw0paN4QtTBozfV3v5x
	 Ewi6zg4fyxiSQ==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k
 <ath10k@lists.infradead.org>,  ath11k <ath11k@lists.infradead.org>,
  ath12k <ath12k@lists.infradead.org>,  linux-wireless
 <linux-wireless@vger.kernel.org>
Subject: Re: New staging repos for ath1*k firmware
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
	<CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
Date: Thu, 07 Mar 2024 18:49:17 +0200
In-Reply-To: <CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
	(Robert Marko's message of "Thu, 7 Mar 2024 09:39:26 +0100")
Message-ID: <874jdigf76.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_084924_499090_033FA623 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Robert Marko <robert.marko@sartura.hr> writes:

> On Wed, Mar 6, 2024 at 8:23=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
>
>>
>> Historically, prior to being incorporated into the linux-firmware
>> project, firmware for kernel.org ath1*k drivers has been first published
>> to Kalle's GitHub:
>> https://github.com/kvalo/ath10k-firmware
>> https://github.com/kvalo/ath11k-firmware
>> (ath12k firmware was pushed to the ath11k-firmware repo on a temporary
>> basis in anticipation of this move)
>>
>> But in order to have repos with multiple maintainers, as well as to have
>> a hosting platform with more control, we have moved to CodeLinaro:
>> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware
>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
>> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
>>
>> Note that most people should not care about this -- normally you should
>> use the firmware that is in the official linux-firmware repo:
>> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/
>>
>> You should only need to access the staging repos if you need a previous
>> version to work around an issue, or if you are testing new firmware that
>> is supposed to fix a problem that you've reported.
>>
>> Please let Kalle & I know if you have any issues with these new repos!
>
> Can I please ask for IPQ6018 firmware to be updated to 2.9.0.1 as well?
>
> We have added IPQ6018 support to OpenWrt but we are forced to use the old=
 2.4
> firmware since anything newer is crashing on IPQ6018, we had the same iss=
ue on
> IPQ8074 but it was fixed with 2.9.0.1 firmware.
>
> Even for IPQ8074, there is newer 2.9.0.1 firmware that is only
> available as part of
> QSDK and the community would benefit from being able to use it.

We are working on getting the AP chipset firmwares updated but
unfortunately no news yet.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

