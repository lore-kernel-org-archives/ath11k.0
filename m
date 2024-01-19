Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD41C47DD3
	for <ath11k@archiver.kernel.org>; Fri, 19 Jan 2024 17:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3T3+O1LvQHPEPgo9aRY8T8pOACNC7+ZPEmXJOsVZh0=; b=Rb702Bf7SLpYUaGRW7QUyqz86f
	0QkoWmCZ5bx7YDfVk/fXuFrC0bgtD4aDD5QRW131fudByyHb+MR3nWslQ+4m9psXJSOOCodEWtsFe
	ihBKgxJLktqed2QqvatcjEhOdSnukNUZfbQzR53PbShcBx9tRA8e+YT0obSjiIaMiSnM6/Yc8LIrT
	wR50FrAcE1IEJoUDKd4wVrzjgZZ+OHy2MUFaNqBuWRXasrjqha3J8TBzM19TssjHCqukTSA7W8KEu
	TntsYfb4foTn/f1YeSkIVpgpa0GcpeZ/hl0DcOAX6sUpIkFDK91Hku//KXtb31KDGgW6xfZvPP3hG
	iwyR7XGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQt2b-006JJt-1x;
	Fri, 19 Jan 2024 17:52:29 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQt2W-006JJF-2A
	for ath11k@lists.infradead.org;
	Fri, 19 Jan 2024 17:52:28 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7bed8fee278so34483539f.2
        for <ath11k@lists.infradead.org>; Fri, 19 Jan 2024 09:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705686742; x=1706291542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3T3+O1LvQHPEPgo9aRY8T8pOACNC7+ZPEmXJOsVZh0=;
        b=cXic538dEoO4kZyAT3G/d80Lgx/nz4Jftk/RCRw+7eLzpQkt2Dl6EgZ5DOf609wC2P
         d7dMBNzY8C0opyn2fCv1l5bOObsSGGlnhWSKOuqyHd3BNuijkIqRBkefCJZcptsKvmJz
         HXVeAhaNUSwcvHFbS6By5hZdo9mYfbHAp8awFdvwdyhFHwguuP/CuxZPr3I1YO6tVcDE
         7lBHSsF6Z+HqX27A0bLC83pM45k6O5oPWA4eL5hgVyNxMF1x1GGBQbdCqSinoJ+rdWMx
         hsf+gCK6fZUaRQdzhsCAAwLrNxQDSbnrcyHA4fdLo4U2izzqGSHLgsePGukpsufx4oE9
         FsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705686742; x=1706291542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3T3+O1LvQHPEPgo9aRY8T8pOACNC7+ZPEmXJOsVZh0=;
        b=ctpoMcso7ZxUzDEddO5N21q+HddxW8Tk8KdkIkAV4Q/8cLVZ0pXZUJxNpBlaVR5h+r
         JVXfTFsgGeupzZDrUbLSyXRcUYR07cN683kIdD+6OVaI42Fmd/rbinALzU25y0Jzja02
         2+uY1y9kb5fAOZeMMJc6yZIX8gkoANDFYuAIqI8nhYCqpevVuPaSmOn04MeY0dBfMPqH
         l6PPF7FRw2fnhCuq/v1eNrTC9kWQaEXNl3DH9g3TcLeY5rEc/w0h7jwnWk82oGoQF+ke
         qdzZ7cG3sYF1F2loVoCkSPpuUQ1so9c6r1m75giMbmkuowoQhCK8qnjJCLBsyBaGQmum
         XxXQ==
X-Gm-Message-State: AOJu0YxLAU88EpKUC1mIx834P2Ayun/hSYLaau+/1DgTTxmtNEFD7WS7
	SvwNGPleiZZ1odKSX0pRFSDOi1NAyOXrNAShZrOiBs/h1aYgp7OJ
X-Google-Smtp-Source: AGHT+IGOhMCobqctkgdGWTXLSsnhLGhqieknIPS+0vBoKAFbYHvrT2iXfa/ApO1FOfuknRRdQ4F96A==
X-Received: by 2002:a05:6602:258b:b0:7bf:31bc:50a5 with SMTP id p11-20020a056602258b00b007bf31bc50a5mr61469ioo.22.1705686742182;
        Fri, 19 Jan 2024 09:52:22 -0800 (PST)
Received: from [10.100.20.9] ([50.225.159.98])
        by smtp.gmail.com with ESMTPSA id u19-20020a02aa93000000b0046ec7716dd9sm376690jai.119.2024.01.19.09.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 09:52:21 -0800 (PST)
Message-ID: <08457e37-49f4-4c51-998b-e577731c8022@gmail.com>
Date: Fri, 19 Jan 2024 09:52:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org> <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
 <87r0ipcn7j.fsf@kernel.org> <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
 <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
 <87mstccmk6.fsf@kernel.org> <df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
 <8734v4auc4.fsf@kernel.org> <e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
 <285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
 <4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
 <3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
 <ee0280fd-032c-4f45-a3f9-50d96d8bed6d@gmail.com>
 <16cfd010-b62d-4385-92d1-002820a8db38@quicinc.com>
 <cdec259a-b779-4856-8585-f285179e3671@gmail.com>
 <21e925bc-ee3e-4421-949b-b3839d2abdef@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <21e925bc-ee3e-4421-949b-b3839d2abdef@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_095224_705351_9E8EB24F 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

Hi Baochen,

I guess you got this output when qemu/ath11k is not running, either qemu 
not started or ath11k module not loaded, right? Since MSI is not enabled 
in this output.
>
> Sorry I should have made it clear:
> step1: start qemu and load ath11k without changing anything, then you 
> get those errors;
> step2: keep qemu running and ath11k there, don't unload it. Then check 
> lspci output in host to get the MSI vector.
> step3: Back in qemu, hard code MSI vector to the one you get in step2, 
> then rebuild and reload ath11k.
>
Thank you for the clarification, this worked like a charm!

Thanks,

James


