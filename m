Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9867C433F5
	for <ath11k@archiver.kernel.org>; Tue,  8 Mar 2022 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMYOzZ9jqRgNpZBWMwIonNKcQmWm8PaOle3TwxGBG+8=; b=H46mA5w9ChCqPT
	HPPNHhkPFnsb8Sud9rKQvfFC6sEmwCFdkLPwO6gIbLyY50TR0ddSof4cTQC9rU5dm4JcW8vcCIlai
	M05Bb6W29BZuYDXBIVw+2bQ6j7RHiWqjGZLKpJ2HDB/VbmZtT1YcTgqs/cBnQaOpD+wVqDApwpMKK
	Tr9MxfJn9+ZFMVHzhB4KRcFCrRhQ0h4jkipC5sgJ4yTkiXzXCQT8ALTExZtIr0RvUyYVJGmR3lZVV
	dxKOOfJSD4ujqYo3vmJDbptM8iCw5khRf+vnCb06lEyto2JStOpROKgwHdQZstJcQB0SSjf2cT5Mb
	pbsg3axO1CcyY5lXhaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVef-003OTu-M7; Tue, 08 Mar 2022 08:57:17 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVec-003OS2-Jv
 for ath11k@lists.infradead.org; Tue, 08 Mar 2022 08:57:16 +0000
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2dc0364d2ceso193687587b3.7
 for <ath11k@lists.infradead.org>; Tue, 08 Mar 2022 00:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eK29sHNSiDUpGi6NWpneouzbiYPMMI/lcw38UTicG30=;
 b=k9tULQZVjJRu6m8Gq5Ll9kgRhd8tERcdkiY612ekSjVykJ1pir1nn+EkUXAQf2yo/8
 SuFgQYE1KohABiZ5lm9kL22aNtiVl79y86inkIezPvhyujxA1/kJ5Ml+IBxFhquQOcE+
 qY/EDnbwXFiU5oFoyMZmfxd8O/22DXcdE0DdbkcjNbzfqwtlJXzQ15z2kBdBisYGtJSA
 sWwRcN6dFrIqVYHA0sjtAQIMUAEdim0/hfYa1JOE7luM1DcuSRG5+wbl/h6gBYCYemvu
 dDl8ohN9z29uR4PsZTb6F+8Hw9k4Hl+W6ad3uAXlu3gBOlG4CvwthoNxHdD2e6deFWDN
 eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eK29sHNSiDUpGi6NWpneouzbiYPMMI/lcw38UTicG30=;
 b=ykoH1FQZJlHVQwZfsiAfP8S7/FS6n1qMoqxYHxKfAUL2xYx/ItVuDuqabOEuz4xn/n
 42+B+h6JLFsMGSdU6g/3ofB3VrWn/EafbVgjDnET3HZ9B2Oacv8b3vtmL6aLevq1Nv9U
 IKyZfYacJQeXYSU01R2zhGbWeslec576LjM+WB3fK264JsQGT2JeUYlQ9iJYklLsjZAw
 YXBtWtzF8qvco5IdwxBKg2sVSXhSpir08ckS7WMnV9xh8abQFLluc8BSgaFW58gDEZUS
 5XSwAxguxZPw20bH9u/HVn3Efp132dIvvUgyLF8/LTj0C9UQJFhoy9JDfIQ4WsyozPIg
 3GWg==
X-Gm-Message-State: AOAM531+EDpHl5hmBgqvk7wkY2Gvzm52+Ol+KK3EzGyGcOzcBDNFOzG9
 rIP4KcShL02dSdgopIaOWHmc/KR5Hfmi/pfMuWc=
X-Google-Smtp-Source: ABdhPJyWO2/gLPPcr09DmRWU8ykPBE0ODoApZfJgeOf03CWqKT9miB+CKa+SGJTe84HgvDk0NMJ6ffq87Ur5CQ2UZjE=
X-Received: by 2002:a81:1887:0:b0:2dc:2425:4dc5 with SMTP id
 129-20020a811887000000b002dc24254dc5mr12059687ywy.335.1646729833187; Tue, 08
 Mar 2022 00:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20220308071827.9453-1-lukas.bulwahn@gmail.com>
 <87o82gsvqf.fsf@kernel.org>
In-Reply-To: <87o82gsvqf.fsf@kernel.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 8 Mar 2022 09:57:02 +0100
Message-ID: <CAKXUXMwhMuUCzATH15GD7was8SkHqcYz-8swTMdE+wuE0yvknQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for QUALCOMM ATHEROS ATH11K
 WIRELESS DRIVER
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, 
 kernel-janitors <kernel-janitors@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_005714_709152_6077A2B5 
X-CRM114-Status: GOOD (  13.65  )
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

On Tue, Mar 8, 2022 at 9:18 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> + linux-wireless
>
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>
> > Commit dae0978d4174 ("dt: bindings: net: add qcom,ath11k.yaml") obviously
> > adds qcom,ath11k.yaml, but the file entry in MAINTAINERS, added with
> > commit fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and
> > ath11k") then refers to qcom,ath11k.txt.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> > broken reference.
> >
> > Repair this file reference in QUALCOMM ATHEROS ATH11K WIRELESS DRIVER, and
> > put it in alphabetic order while at it.
> >
> > Fixes: fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and ath11k")
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Kalle, please pick this minor non-urgent clean-up patch.
>
> Can you resubmit as v2 and also CC linux-wireless, please? This way I
> can pick this up directly from patchwork.
>

Sure, I just did so, see:

https://lore.kernel.org/linux-wireless/20220308085503.537-1-lukas.bulwahn@gmail.com/

Lukas

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
