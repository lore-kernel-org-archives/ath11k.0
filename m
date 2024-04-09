Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD83C67861
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quR69Vph6QZk8wTj3CxA3Vuk+DHTtNPbi3L7fQe7qyM=; b=axVTtdmVnhjn+7b4PhGWcqI5Mv
	vJykSqtuMh8nSRtf6rcU/HjI4gBTasFbvMALfts1w9NiCZDqTGefsduN9r8P6zpJXnfkkbFPkcpeF
	VPM4EfJJGl4hveHOC3F3kvAEJBpb3oITdeCOckgHqlSb8NfaSAgqfLZDt2evwU7uRxYVf+U0jCXJt
	k23i6UR5WE37LYqnJa/liF/68SXuIKJdYnuW9HyDcOQ9lN7Lf8+O8H2egDKTIWDDFRQGg7VHQwSnP
	FRfIBmuYHKf2JOLBeJFXbXKBOxX3xf6s713JP6w45iVCuL/E3Q+0+70ge8BP13jfDcrI8w9Y1B34B
	M2iy9i5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHoa-00000003f1a-1N6u;
	Tue, 09 Apr 2024 20:11:32 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHoY-00000003f0o-0NuJ
	for ath11k@lists.infradead.org;
	Tue, 09 Apr 2024 20:11:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ed2dbf3c92so2151359b3a.2
        for <ath11k@lists.infradead.org>; Tue, 09 Apr 2024 13:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712693487; x=1713298287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quR69Vph6QZk8wTj3CxA3Vuk+DHTtNPbi3L7fQe7qyM=;
        b=Vci0coN8HtPHykdhCn11l9nDRUNznrohdCJyunav7a2tFHun8Sl0W1Cn4P1Y6UXvzZ
         z/lHJzq3IEMnelpqcqMDVwQ6Jb4rR/sA2cYe3uNXOnhqhpDAVErzOuJQT+FUrP3++lJi
         aHwCvTEcCSRf/V2iRfaA+auXFpIkqPrBiyFB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712693487; x=1713298287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quR69Vph6QZk8wTj3CxA3Vuk+DHTtNPbi3L7fQe7qyM=;
        b=ej83YFoTxwUriJPi8pe3qmg8XGcBN++X6t51svpGjkkZsgR6jwHVcj1FN7mJTnpt/A
         5MtXzoPmrrYAlbU+L+iRGstCkcsUslku2DejP1h586p7Va2IeolKmTMdbi5LJMGlukRx
         X9uBAU1VVU9XYZah2D/nSkKB95rlSt+YQFBohd6SWlsTRIgEcKz210OA5kODdAOpsUnt
         xlE6GxgG/e2qbIpBju47FfB6aEq2nM1l9n11C9/w5r0SfHU//8MrK5kWWTWtdeWFMTZc
         NBejo2ORs/RYrLjPlzB2xJkob+z9AKj0qpy8TiP0UF8S47ua+85d/+2B47jFGtzoBpFl
         GSfw==
X-Gm-Message-State: AOJu0Yw7t+8EEFfZxzNPpTRIgUqMVXb/+GVJ6UcbeU24WcbeoEO1qm3t
	iALSNeiUfE2Qw3rQ/+/de9ZcASH+gDGoWHZpEepD8dkLJCjG1fhCwOw6Dsa7NQ==
X-Google-Smtp-Source: AGHT+IEV9FjHyEeFBCNWZRzeMlmeuVqoS+Kkk0tZB1U5HYbzCUTGFX+rT3l7FC8S+vG0ZdHPRJ40SQ==
X-Received: by 2002:a05:6a20:1582:b0:1a7:4887:771e with SMTP id h2-20020a056a20158200b001a74887771emr1004728pzj.44.1712693487464;
        Tue, 09 Apr 2024 13:11:27 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id c6-20020a170903234600b001e4478e9b21sm3859461plh.244.2024.04.09.13.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 13:11:27 -0700 (PDT)
Message-ID: <fca46585-c1ed-4a60-91b5-6da39a5bbdec@penguintechs.org>
Date: Tue, 9 Apr 2024 13:11:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
Content-Language: en-US
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Marcel Holtmann <marcel@holtmann.org>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
 <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
 <b592d037-41ed-42e8-8c3c-286eb1a68ceb@penguintechs.org>
 <68a31d6a-8eb8-4d78-819b-fb67367cc41d@penguintechs.org>
 <CABBYNZJQUy37fxWuCXV1OgM+DNnOr7V0h_rkgcSdw-5hF7iauQ@mail.gmail.com>
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <CABBYNZJQUy37fxWuCXV1OgM+DNnOr7V0h_rkgcSdw-5hF7iauQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_131130_172253_2A582DD2 
X-CRM114-Status: UNSURE (   6.21  )
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

On 4/9/24 1:03 PM, Luiz Augusto von Dentz wrote:
> 5.19 seems a little too old, imo, or has it been broken for that long,
> did you at least tried with bluetooth-next? Try contacting the people
> who actually wrote the driver.

Sorry, I didn't answer your question. Yes, I do think it's been broken 
for longer than that, but I wanted to confirm.

wt
-- 
You're more amazing than you think!

