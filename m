Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741ADCA0EF8
	for <ath11k@archiver.kernel.org>; Wed, 20 Aug 2025 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/gyvWOcQvvcUFNAAR36SpZ7Qmtpec5uKGHhrZ1PSa4=; b=gba+dR/RvBNqqFCrukw3vho/hX
	IYGZoutyTFF7/n47Q/LyTh/iHgpqu9vOj21FYPv9bGIva8S7fPAbQdsJiWrm1rnkEe9eRwk2ge5nL
	1fBf2mSNPa1ogoHPyzsIiAaw7T6WLb26DGIegEeb7spVPjBnJJUbqMH5nPQ/DdGyQHtZ4zSrU/m7w
	/mcoV3/AN12FT2hRGGh34bVDY1KtGoZDT5BAtL89X2e1Yufbq7gA4WuVWxVrel+rxbMg2V1GzDswH
	RtN8CzfqfYpHByjur16/3AnUC3yByIhWiMeEJZM5scKF3UdYhE4cy2WfpdURKSSUFKbPJAkkl2WpE
	c9h7xvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoevN-0000000CsYx-0baC;
	Wed, 20 Aug 2025 09:16:05 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeGU-0000000CkzZ-2sd3
	for ath11k@lists.infradead.org;
	Wed, 20 Aug 2025 08:33:52 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-890190c6165so1955297241.2
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1755678829; x=1756283629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/gyvWOcQvvcUFNAAR36SpZ7Qmtpec5uKGHhrZ1PSa4=;
        b=ICRK6EuzLy11lk/96CjGfml7HrNi1FCLLebHw5vdG7Ph/PA7GUILIVXxuVwGSDK67N
         JYsNJ3xIwvvr9aKZEiTwPWJ0FWGysaIoY6S86lMJifIQKi2/jbJjWI7Ud5mILW8fHYJs
         BXvd53kPeMh2HjiK2NZK6iiE8zX9+ZRKpIDFa/t1/h7qek6SfQ8yRtupqXHJDcRmwo/+
         p4ezl8d8IZ7wIP9Vhjwc3RFyuT8qpx/54Gkifz23ds4C/OZFQhJ6naryXEKWQ0Ospznd
         m/hgt31ubVd+3cMG1Fw9h9pnv8g59OVZs4EWDU5hteGadizJbdU87/Xgw1pLdx6mCQr/
         owDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678829; x=1756283629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/gyvWOcQvvcUFNAAR36SpZ7Qmtpec5uKGHhrZ1PSa4=;
        b=XGcOdwE3BcPzvrH1Gzbr36cSIAjko7e3GMO/KEOS/vRNeQ94W8OOOcBbIeHwmJAdjW
         ksUnBIMi9WB1iUvAGG/qQPwETUIvDv2uRAkMd8IP2J8XmiJeH8KSSwWJc/Q33uvVqghc
         WmzEXRHjhWqB4TPXtM4pNJjMVBjUuxEblppzXLJpu14xpEA7X2SvYlNA3HhC1JIx2oZT
         p/1BMCbsxWn+L+J8G1OrPzrueCGASpbD27azZEvTwWC+6txPBC03WwXOzqSB8twyDgxZ
         Xl8J0zH9zIlLvuIzqhIYjzmT0dm6MLRi65+9/Kow8B2IkD5MQQg/nJsS6u1cgwrL7hpg
         g1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWybxbPJsqks0Y/OLB6l3oqXYgEhGoKg2XvDKxN7egD7uratuIHnw9EHCgwb3XiHcZhH46zPyU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8kAS/jPKt+hdY3aGjSNVySg7OH7fDUGeLy0Av+qCpsroTfWXb
	F8JcigfmCx0xItwzR4RBrHQ3OC1VpcvaogvUJ2raIh03nTifL9n8MZxNjA8vAEfvmSS+xmdhbnn
	kqXfuSiwETjF6rJ5B92PB/IrxmWke+BFgopb7FMaPWA==
X-Gm-Gg: ASbGncsPvpST4iifm4CXzrwm9qo9yZQuEp+b9fkMgdPRbp2XoaUn9IzIAiWU+F44fsX
	BfGk43L6onZKnme1LX/f3jrvcLrQSJKtkDYsQqrNrSpOJeXj0ga2KIHgfvSRllERMPqEOS/UazA
	5ySXbuCthG/P978Dr/HY7y+KBU2Vkru4o34LnOuDYXlw9c08NZ7TKrGNo3DvALFDHtg7qYXxLHD
	JBA02MZvRQHf39Yt8O8
X-Google-Smtp-Source: AGHT+IGdwXIo/Lq9pZ04mpZIutVXJE985PZFUOtHZA5OEt4PiHNjNukjGyULyBSg0KQSY620R9BtmZCsCh8F1Z9M8q4=
X-Received: by 2002:a05:6102:510d:b0:4e6:edce:4b55 with SMTP id
 ada2fe7eead31-51a4f437ef3mr574122137.4.1755678829651; Wed, 20 Aug 2025
 01:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com> <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com> <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com> <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
 <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com> <69f3fef9-017d-86fa-8fbb-2ac2a1df8ae4@quicinc.com>
In-Reply-To: <69f3fef9-017d-86fa-8fbb-2ac2a1df8ae4@quicinc.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Wed, 20 Aug 2025 10:33:13 +0200
X-Gm-Features: Ac12FXyhq9h9XK7ltDa2jzIR2ta6rp-lPJytWMAmWt01wbo3Vckwg9PTfaTdmSo
Message-ID: <CAONkfw4cQktTqR6e3PGfVhGQPsqPctwjwLSPjdiAvm45tq5qEw@mail.gmail.com>
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_013350_735063_C44F6E4A 
X-CRM114-Status: GOOD (  22.67  )
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

On Wed, Aug 20, 2025 at 10:03=E2=80=AFAM Vasanthakumar Thiagarajan
<quic_vthiagar@quicinc.com> wrote:
>
>
>
> On 8/19/2025 2:20 PM, Balsam Chihi wrote:
> > Hello,
> > I Have a question on the same subject but not related to the bug.
> > I have many identical PCIe WiFi cards on the system and I need to load
> > a different board-2.bin on each one (1 adapter per frequency band).
>
> So you are using multiple pcie devices at the same time in a system
> with ath11k? Wondering if you are using any private patches to address
> QRTR instance id clash issue [1][2].
>

I'm not aware of any issue of QRTR instance id clash.

> > Is there any kernel built-in solution for that?
> > I could not find any, so I had to create a patch that loads a
> > different board-2.bin for each card based on the pci device address.
>
> Current board data selection for QCN from board-2.bin is based on pci+chi=
p-id+board-id
> combination, not based on pci device address. You can find the chip-id an=
d board-id in the
> debug during QMI boot stage. Then you can use ath11k-bdencoder [3] to enc=
ode those
> board data binaries into board-2.bin. This way you can package all the ne=
eded board
> specific binaries for a hardware into a single board-2.bin. Ath11k board =
data file
> load logic uses chip-id and board-id to download the right board data for=
 the given
> hardware variant.

I have multiple PCIe WiFi adapters based on QCN9074 from different
manufacturers.
The problem is that I could not distinguish between them at the system leve=
l.
All have 0xFF as board ID.
So, when loading the default board-2.bin they behave the same way.
When I contacted the manufacturers they sent me board-2.bin for each
configuration :
2x2, 4x4, 2.4Ghz, 5GHz... (maybe calibration data and more?)
The default board-2.bin for board ID 0xFF does not support all bands.
My requirement is to have 2.4Ghz band on slot 1 and 5Ghz band on slot 2.
So the patch reads from rootfs a text file named with the pci device addres=
s,
the path to the custom board-2.bin.

P.S. : qca-swiss-army-knife did not succeed in decoding the custom
board-2.bin files.

Best regards,
Balsam
>
> Vasanth
>
> [1] https://patchwork.kernel.org/project/linux-wireless/list/?series=3D69=
2423&state=3D*&order=3Ddate
> [2] https://lore.kernel.org/all/20230111170033.32454-1-kvalo@kernel.org/
> [3]
> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath=
11k/ath11k-bdencoder

