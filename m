Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8866C47422
	for <ath11k@archiver.kernel.org>; Fri, 26 Jan 2024 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B52crvW+pF4rOt/HhWqKjjZjJneCdMaxYBv6KgCO1Dc=; b=hX8FC9OXBF3Ia2knWOFrFYmant
	NFPtyJhYaQ/hrJUKUr+XQr28aCf8pZYsEbsIPVQX6Y5r8hzGkQODhXcqvZU9ebb+xegLDQsn5WDFZ
	69oxWTPn97yctkrdXcINevz7Onxyn1d09+WwzZ8v1rgdOnSM2fsh6DHNHaQ9q0fwGGO3eM1u8Jy0h
	rIJgZcSgkz8x6LUHK6p+02rpsECZrripwLx31N7+Gq40Ov5I8i2F3i8Pi7VdRuNaafKSeNBAqpdiM
	STzfvCJcrNiGRVGKtpskWGo1EfzTvvITj81yhfNJG50Mb+bv5yfkyj39XvjqYN0Ux6TurVgV6629l
	pYW7c6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQoK-0000000533D-2lui;
	Fri, 26 Jan 2024 18:20:16 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQoI-0000000532o-16w1
	for ath11k@lists.infradead.org;
	Fri, 26 Jan 2024 18:20:15 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-783caa65596so52374885a.0
        for <ath11k@lists.infradead.org>; Fri, 26 Jan 2024 10:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706293211; x=1706898011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B52crvW+pF4rOt/HhWqKjjZjJneCdMaxYBv6KgCO1Dc=;
        b=k6H0rP+mrPBXG5icMqcRGrTIHUEz9vbNLgNZfpbMLVufF9iqu5IaqhkMkkid4g5eh3
         dH1YUsqD8GWi5XO9dhttiOD0mIIu+lq+8+gRphUYPVGLBGpOU2OiaalNyLQO1+RhVSAe
         b049dXZnb9caFkWQIIvCoM69IzxCyaZpd1Pb/p4RoT47EqCOfrKtVfdATirc9nfti6Db
         kU+oSGPz6A5T0Z1Q9gCLLifNXmuGxU2xB27eDGHmctX69Jj/Q219Cg2Zue6E5EOxZjaW
         9oTqu9dTAXsU9q8nbvWte13acs7bHGItNQDP2gmkFgQ3eFTbmP44DiBnwKJ66sy65lnk
         f1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293211; x=1706898011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B52crvW+pF4rOt/HhWqKjjZjJneCdMaxYBv6KgCO1Dc=;
        b=szBqKBZLp8OhteilfsKPZxXWP8P2Gunn53w9Ha8Pn5D3YDsg9VL/LfaYR/AEhHUWxO
         oRhXDr1GyO6hPzfTEvlLOqMh28KU2frBtlWAxOcaUHYoRH9qCxtuFfSB2IR64PeGOHlW
         a8S57+koqgiPD5hJ5ZPT0VU2nId6XcMDckzJqj/n0ZuP+Us2qFgW7TpOeJuym0asj0Ye
         PapumF9y9yMZqPEsWpCh83PFcT9Z8QJnTncvupvrSl3zGy7Jw2erYiZC/jxgxjJYUMiG
         EOrCWU86qtDbmqJ8YSrpMvEmEAABWem/kbGsf2+tQKSD9ONrl5lVCx4oPy7wjisifW4v
         DV8Q==
X-Gm-Message-State: AOJu0YwPllGygxOPWJFnBe33H+nq+ug/Bp+NTjEVAS9bhkj8c0igkqfC
	pBGxqB4G1b7pehTV3Y+bN81tC9mylSlocnw9i/54Mlvv4jyi3CF+
X-Google-Smtp-Source: AGHT+IGgPhyNLioUANs7Ur2Pxv3+d7AKhqa5n5NJGrXQSfXMwsNFwman8zKAtICBRKi+lN59w4thfA==
X-Received: by 2002:a05:620a:2f0:b0:783:b593:519d with SMTP id a16-20020a05620a02f000b00783b593519dmr222042qko.71.1706293210878;
        Fri, 26 Jan 2024 10:20:10 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id q14-20020ae9e40e000000b007836720b96asm790634qkc.24.2024.01.26.10.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 10:20:10 -0800 (PST)
Message-ID: <8b938c5f-a8c1-4fc5-aaf5-501f097a1db0@gmail.com>
Date: Fri, 26 Jan 2024 10:20:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
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
 <08457e37-49f4-4c51-998b-e577731c8022@gmail.com> <87o7dh2oky.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87o7dh2oky.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_102014_341058_C29D4D55 
X-CRM114-Status: GOOD (  10.35  )
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

Hi Kalle/Baochen,

On 1/19/24 9:57 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>>> Sorry I should have made it clear:
>>> step1: start qemu and load ath11k without changing anything, then
>>> you get those errors;
>>> step2: keep qemu running and ath11k there, don't unload it. Then
>>> check lspci output in host to get the MSI vector.
>>> step3: Back in qemu, hard code MSI vector to the one you get in
>>> step2, then rebuild and reload ath11k.
>> Thank you for the clarification, this worked like a charm!
> Very nice, huge thanks to Baochen for finding the workaround! James, let
> us know how it works for you in the long run. This would definitely help
> automating ath11k testing so I'm very interested about this.

It appears this hack isn't a reliable solution long term. It did survive 
several reboots but then I was back to the same behavior. Looked at the 
MSI vector and it had changed:

It went from fee00558 to feee00538

But at least I can just modify this and get it working again.

Thanks,

James

>

