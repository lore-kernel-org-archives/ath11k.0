Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78098C54E49
	for <ath11k@archiver.kernel.org>; Thu,  7 Mar 2024 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hS8zu4sRYSZWgtYsgxH06GASLmu07y/0dobyT5SPg6U=; b=WGFJM8X2v8IEquSBHeCbQ9m8cL
	bmWzdjcfXGZsADBF6VDGWkbt0aXPUaZqBl9Tzk7caqsBEES4PD/Qnt07GRNKwxlAl7BpX3OOfcjRu
	C7kHY0qzmRQzqc0Mft5UNHWLiKnQjMNobhJ0yfYEmQky+ZRtunXNQOom+BF3cHbVLQMybCuIBzNH0
	GROT6rpUigbRVsYoUyLmWSdy1I3o4bQHRQMDwptL8gxGJbGd47AMgHHjhRLzdpKwNrupIfPLuVkT+
	DPmzsvahxsXMEBlVJWLtLk6o3jQqxyCrcuMV18ghzZQYP0UmfL13nx5jQre1PJGDn3yvOoOBXHAGi
	ah5fEz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9I4-00000003g11-2ieB;
	Thu, 07 Mar 2024 08:39:48 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9Hy-00000003fui-07cD
	for ath11k@lists.infradead.org;
	Thu, 07 Mar 2024 08:39:45 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-29b7b9a4908so357963a91.1
        for <ath11k@lists.infradead.org>; Thu, 07 Mar 2024 00:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1709800777; x=1710405577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS8zu4sRYSZWgtYsgxH06GASLmu07y/0dobyT5SPg6U=;
        b=z5EiG5Mq0lq8UGHnfrMqW4ho0okN8NmRb49Z4buhbFK44YcYF2JhhgcelDTtfWxJAW
         /4myXWJilF8BLblNPIrlmNA7JiShGyxtxkyjYIUBCRyLY/2UpR4MFPoqipiWjIHfQyjV
         aITcoKD+DInXaCxU8sUUnKpxqTE7sCbzNCZMO4t+BXzRoGdF3l4x+/mnmJR9LR6agTiE
         iabeX+74YKFfo+oesqpSLbZhAB5sNa1ChNOBwAdlhv50V8UHAK8JuaKm8zwrU2NGt1MO
         7+dDwCavhxISK3mG0SJwhZD0BnuFojcGCv2wZ29WNguLSk09ispmKxHdbvvV1JIfQLOt
         mybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709800777; x=1710405577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hS8zu4sRYSZWgtYsgxH06GASLmu07y/0dobyT5SPg6U=;
        b=MRiDbF704LZUBKpB0FtLg8HCLtketnpC6yoFwoUeS4hyNwLpWefgyEA3MAZ9ym6wdp
         KXoBtVFC1SyPY18FMRJv7AEqzAzAAlicncizuege9mXfcURxOe6GW1IGNs/2UxCKbCb6
         DrzjPqGYgti5gyadidwWJTmPOaNkrNmLxG9OWBNyB3fcKvXb/JjHqex9QNrSEA9D89si
         VBwGIldQ1nPHeJgir1huv+0960WJJ/61fIsUIosTI7QPmRq9UTYA8S47M/NdkgaEobKS
         oxBiZiYWbKSkWolUZdYYFwTny+wM+zCWBddTl3U1CHO6kLIvbs1+Xt6/k6hxqyL3iNST
         B3jg==
X-Forwarded-Encrypted: i=1; AJvYcCXvnt5syBDHUfelCfX0T8BNnYaaLGnMslVbu/ko11pdgJvjdZkFlHWwQUTHFiuGfNszgHPGEgh08+NeK2PP5onXfcecPG3rbCQ1vQ==
X-Gm-Message-State: AOJu0Yy3HyukVRxSJ9Pn5jvu3/FQO5HkrA25Jo51Q46HuSUljptYJpLV
	tZjFUCeQPAxWFLAys/0ctthZjM+16U902R/t5zdTFzIhdwFbYubhYGHo6twEX0UO2kKaaedB6+j
	x4LlqrowEuVjrQkYqyBt1+WhF+rBnqT7KU5lCmg==
X-Google-Smtp-Source: AGHT+IFtYoz85x+BrsyL3WDeniAwghS6EjRoEeJUdL1XSOqljGL47ACIuTJtfbK74x/u65ZmTCLctG2MbKAUjQXLWiY=
X-Received: by 2002:a17:90a:9b02:b0:299:2807:1eb1 with SMTP id
 f2-20020a17090a9b0200b0029928071eb1mr16879947pjp.34.1709800777227; Thu, 07
 Mar 2024 00:39:37 -0800 (PST)
MIME-Version: 1.0
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
In-Reply-To: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 7 Mar 2024 09:39:26 +0100
Message-ID: <CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
Subject: Re: New staging repos for ath1*k firmware
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k <ath10k@lists.infradead.org>, ath11k <ath11k@lists.infradead.org>, 
	ath12k <ath12k@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, Kalle Valo <quic_kvalo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_003942_157441_10ED1BEC 
X-CRM114-Status: GOOD (  18.71  )
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

On Wed, Mar 6, 2024 at 8:23=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc.=
com> wrote:
>
> Historically, prior to being incorporated into the linux-firmware
> project, firmware for kernel.org ath1*k drivers has been first published
> to Kalle's GitHub:
> https://github.com/kvalo/ath10k-firmware
> https://github.com/kvalo/ath11k-firmware
> (ath12k firmware was pushed to the ath11k-firmware repo on a temporary
> basis in anticipation of this move)
>
> But in order to have repos with multiple maintainers, as well as to have
> a hosting platform with more control, we have moved to CodeLinaro:
> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
>
> Note that most people should not care about this -- normally you should
> use the firmware that is in the official linux-firmware repo:
> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/
>
> You should only need to access the staging repos if you need a previous
> version to work around an issue, or if you are testing new firmware that
> is supposed to fix a problem that you've reported.
>
> Please let Kalle & I know if you have any issues with these new repos!

Can I please ask for IPQ6018 firmware to be updated to 2.9.0.1 as well?

We have added IPQ6018 support to OpenWrt but we are forced to use the old 2=
.4
firmware since anything newer is crashing on IPQ6018, we had the same issue=
 on
IPQ8074 but it was fixed with 2.9.0.1 firmware.

Even for IPQ8074, there is newer 2.9.0.1 firmware that is only
available as part of
QSDK and the community would benefit from being able to use it.

Ideally, ath11k-firmware would at least contain the same blobs as the QUIC =
repo:
https://github.com/quic/upstream-wifi-fw.git

Regards,
Robert
>
> /jeff
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

