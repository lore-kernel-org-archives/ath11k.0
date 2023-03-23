Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E12C6FD1C
	for <ath11k@archiver.kernel.org>; Thu, 23 Mar 2023 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuRODc6OeOdqguVyRB1QiOV/RIoMAJHt3f1YNx/AI9Q=; b=zCuBbqh2KEqIx7
	bU+/Q5D6+MFzhEBIpAuRDom1Qy1pjgkEkqtYvbTdeRVAbQ7g/I6TmAp/FHMFyuZMQ2BplsI6hC3x+
	kXu47CjvH514A5qtrcrlImynePsU5h9C7zALxs9LBc8DuitYyu7fnwwLBXVtOvYEvsY2lZf/AIVAZ
	mAS1Ktg4iAT9gqb+b/GOn4i0emHdV19UA1qM9oo60Qh+dO8jGGSKLs0SeWMwSOaBkk6Aon7uYAV90
	0KGkMiHqHEa4LRQNpmvbTfSH0BrE20Buxg+DDXVSmiB3FhfEbCOD3sS9cVcmWfWUqQDXZCcCZ22dS
	9cFmP1d+4HZnSlQcMylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfI2U-001YPm-2M;
	Thu, 23 Mar 2023 10:19:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfI2R-001YOr-2X;
	Thu, 23 Mar 2023 10:19:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7405A625A0;
	Thu, 23 Mar 2023 10:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6258C4339B;
	Thu, 23 Mar 2023 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679566757;
	bh=iFJ0dkfOZcvaIQ3ZbdpbveioIRv27g+mvElOL3bbjQo=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=R33ga/d6UTStTQxmB4aRweFN8ZDbDdmlk1qXXmHygvPHiOcWF0EuBo1ooSt71O/DO
	 1U2BD9/lxM7sILSn11/f2BuF3/tgO46zJaXCJKM39r2YUjOShV3QrXC19P5fXbsoTi
	 uIUfvk6h8RqUuoJYsRyFxLGCqoF+L0i6dtkPbiZ6i+J395ZG7GkUZslSaSgj47J1gs
	 rZjJcDh780KGD2jz/m2KvzUPgNLvubczmM8kJw/vuo5NDZOEhiW7uU579ardqcFAOS
	 XKytJFo1Ib6EVopZ6OK6AdKg7cvUjrk05YDDoFTrcf3B4pPHC4rRV+WMXRwUnXJyyS
	 XDttGd9erQyjQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  ath11k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
References: <878rgzuw37.fsf@kernel.org>
	<f08d7310-8c33-ab0b-c9f1-317f737ba37c@linaro.org>
	<87v8ite3g4.fsf@kernel.org>
	<CAA8EJppge=2Zf1CZPY4sUNkC2VzhDQ8ah8f3x6LGAky=PdFQrw@mail.gmail.com>
Date: Thu, 23 Mar 2023 12:19:12 +0200
In-Reply-To: <CAA8EJppge=2Zf1CZPY4sUNkC2VzhDQ8ah8f3x6LGAky=PdFQrw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Thu, 23 Mar 2023 11:35:01 +0200")
Message-ID: <875yarepnj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_031919_920057_C82C2E97 
X-CRM114-Status: GOOD (  16.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Wed, 22 Mar 2023 at 07:54, Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> >>   ath11k/IPQ5018/hw1.0/Notice.txt          | 4094 ++++++++++++++++++++++++++++++
>> >>   ath11k/IPQ5018/hw1.0/board-2.bin         |  Bin 0 -> 524564 bytes
>> >>   ath11k/IPQ5018/hw1.0/m3_fw.b00           |  Bin 0 -> 148 bytes
>> >>   ath11k/IPQ5018/hw1.0/m3_fw.b01           |  Bin 0 -> 136 bytes
>> >>   ath11k/IPQ5018/hw1.0/m3_fw.b02           |  Bin 0 -> 262144 bytes
>> >>   ath11k/IPQ5018/hw1.0/m3_fw.flist         |    3 +
>> >>   ath11k/IPQ5018/hw1.0/m3_fw.mdt           |  Bin 0 -> 284 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b00           |  Bin 0 -> 532 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b01           |  Bin 0 -> 520 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b02           |  Bin 0 -> 7552 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b03           |  Bin 0 -> 545008 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b04           |  Bin 0 -> 86788 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b05           |  Bin 0 -> 17776 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b07           |  Bin 0 -> 1488 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b08           |  Bin 0 -> 4096 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b09           |  Bin 0 -> 2330624 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b10           |  Bin 0 -> 269028 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b11           |  Bin 0 -> 99436 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b13           |  Bin 0 -> 7024 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.b14           |  Bin 0 -> 1668 bytes
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.flist         |   13 +
>> >>   ath11k/IPQ5018/hw1.0/q6_fw.mdt           |  Bin 0 -> 1052 bytes
>> >
>> > For the past several years, the Qualcomm community has been shifting
>> > from the pack of .mdt+.bNN files to a single .mbn file as a main
>> > firmware file format. It reduces the back-and-forth between the kernel
>> > and userspace and also simplifies handling of these files.
>> >
>> > In-kernel mdt loader provides backwards compatibility, detecting the
>> > file type and using .mbn instead of .mdt one, retaining the name (or
>> > using symlink).
>> >
>> > Do you have any plans to also shift from .mdt to .mbn?
>>
>> I have not heard any such plans but I'll ask around. Would you mind
>> filing this to bugzilla as a feature request?
>
> Done, https://bugzilla.kernel.org/show_bug.cgi?id=217235

Thanks, this helps me with tracking.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
