Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B032AC6FD1F
	for <ath11k@archiver.kernel.org>; Wed, 20 Mar 2024 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbVZj4I/+AtmVzGEkeHLDd9U7wOTVaVZVt9tQRs8U4g=; b=hrsRuOTjrGrgF1TzG2yzwUuAP8
	XU6xSQLiKdEk6+WJ4BskEOo9fETtUFD3xWkfHDzLj5XT+O5rEH3v300Nbgv8vkG09nMQMPS4DLF1b
	5LVbqi2OyCnwbzeRa677u8+wLhucIsHfjt/daDRRAUNjO0rXPY+paHgGmw8VJBbktqT0LV7MLcts+
	ojGR/BSbD4DCyY2p/GnMICRI8sezirgIpQjCAjhabF5WWnxvNxNavSJF5YzvhwJ1HOzjAXWhcfYiX
	Un8ae9fsgTTqejgupvnCMGpqvc/sqtYeKrTKY3O7GmCC6rT2te46DCCZrQv77euPR4spO0pPiE3uV
	Aq0xtEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwZl-0000000HMdT-0Zjg;
	Wed, 20 Mar 2024 14:05:53 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwZg-0000000HMcW-32AE
	for ath11k@lists.infradead.org;
	Wed, 20 Mar 2024 14:05:50 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-781753f52afso369893085a.2
        for <ath11k@lists.infradead.org>; Wed, 20 Mar 2024 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710943546; x=1711548346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbVZj4I/+AtmVzGEkeHLDd9U7wOTVaVZVt9tQRs8U4g=;
        b=m9lRV7eDFtIjn5ONDl7Pzf/ZQpmz4lbQ+1jcG/i7vL+mI7N5b0NRtLATvrHJnpBZfP
         SJhkLGsUupOgvdGpxml/gCtdNtgU/fbR9CvyLXw1egwrhShoiEWawEprjnHiK+eRVtjZ
         +2ew7c1U3ri3meMcjiZ5B2lK1MFn1NKMdEANh2ElNz6PzD4geDtNQk7Xeb3msEHpHQcf
         LwKnmybz1fBhcQW4BPHNd1PLglyaQr8ua5QCy5Td0bgF9eYKpex/RAKFYn1dntwaclq0
         fuXLPtugbDI8HNz6reIURyEEDdApw+IUFjDmOqAxOxBAbrL4CxiniIpWu9iXyy24oAIq
         sNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710943546; x=1711548346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbVZj4I/+AtmVzGEkeHLDd9U7wOTVaVZVt9tQRs8U4g=;
        b=nlR0CkfoZBrUZY3cPmpcOeYVx94GThSmy3HBKWcbt1SpbQrI5dvUR2ihyIFt+fN7in
         MOX2tBpn0HRzwcp+GqreSZHUQ/mvQT7J43wtpwMLVa2wjOVX7U7TcK6YMwdcz4/bIef6
         SD50QP7qfEEq+sgWqcjN0QCrNRwFsrIfi8qceGNFwKBXOmM/vvZr+Q9nXIYRuVAjRBJw
         HTVVeiCXzF5ktlAb7vczx0axZBD5UNqIcciSePoUvkwMR1vOrSe3wUUOPLqnkFDgWylZ
         auK47GmopMfoPl2y7iKZqyMSfxn4yZy8HBTX/V7r6z3C3FUeCQW+JsmMJCZ3yBVUUkf1
         KyvA==
X-Forwarded-Encrypted: i=1; AJvYcCVGOz9P1yetnRg71KzaOeGo1h78gREmZFvR4vf+M0vJpXho7e3eZoBWREeJMGgm1vK0fe6pveIdptLSuAxAl3n+84yInvD6mZagcA==
X-Gm-Message-State: AOJu0Yy4blruqWwKXDLCUWFhQPDjBfkHE4b2/nnU6HJeOKUBnMNurnO7
	CkuywRYzsvx+vdIVVa7V7t2ECVxWYuN1NKhOprWIUGuvcvOnxA03
X-Google-Smtp-Source: AGHT+IHdFGTq79nxwV181SXlfpWpmVH8EOQMcMbibgVMzCRjKbbjt3OJomu78LqTAbfs0jIAcEVAMw==
X-Received: by 2002:ad4:46d4:0:b0:691:fcc:1518 with SMTP id pm20-20020ad446d4000000b006910fcc1518mr1677638qvb.65.1710943546178;
        Wed, 20 Mar 2024 07:05:46 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id k5-20020ad45be5000000b00690baf5cde9sm7854440qvc.118.2024.03.20.07.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:05:45 -0700 (PDT)
Message-ID: <a44f21e3-1773-4b56-b1f0-c03a6462a7c1@gmail.com>
Date: Wed, 20 Mar 2024 07:05:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allocate dummy net_device dynamically
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: kuba@kernel.org, keescook@chromium.org,
 "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
 "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20240319185735.1268980-1-leitao@debian.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 xsDiBEjPuBIRBACW9MxSJU9fvEOCTnRNqG/13rAGsj+vJqontvoDSNxRgmafP8d3nesnqPyR
 xGlkaOSDuu09rxuW+69Y2f1TzjFuGpBk4ysWOR85O2Nx8AJ6fYGCoeTbovrNlGT1M9obSFGQ
 X3IzRnWoqlfudjTO5TKoqkbOgpYqIo5n1QbEjCCwCwCg3DOH/4ug2AUUlcIT9/l3pGvoRJ0E
 AICDzi3l7pmC5IWn2n1mvP5247urtHFs/uusE827DDj3K8Upn2vYiOFMBhGsxAk6YKV6IP0d
 ZdWX6fqkJJlu9cSDvWtO1hXeHIfQIE/xcqvlRH783KrihLcsmnBqOiS6rJDO2x1eAgC8meAX
 SAgsrBhcgGl2Rl5gh/jkeA5ykwbxA/9u1eEuL70Qzt5APJmqVXR+kWvrqdBVPoUNy/tQ8mYc
 nzJJ63ng3tHhnwHXZOu8hL4nqwlYHRa9eeglXYhBqja4ZvIvCEqSmEukfivk+DlIgVoOAJbh
 qIWgvr3SIEuR6ayY3f5j0f2ejUMYlYYnKdiHXFlF9uXm1ELrb0YX4GMHz80nRmxvcmlhbiBG
 YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+wmYEExECACYCGyMGCwkIBwMCBBUCCAME
 FgIDAQIeAQIXgAUCVF/S8QUJHlwd3wAKCRBhV5kVtWN2DvCVAJ4u4/bPF4P3jxb4qEY8I2gS
 6hG0gACffNWlqJ2T4wSSn+3o7CCZNd7SLSDOw00ESM+4EhAQAL/o09boR9D3Vk1Tt7+gpYr3
 WQ6hgYVON905q2ndEoA2J0dQxJNRw3snabHDDzQBAcqOvdi7YidfBVdKi0wxHhSuRBfuOppu
 pdXkb7zxuPQuSveCLqqZWRQ+Cc2QgF7SBqgznbe6Ngout5qXY5Dcagk9LqFNGhJQzUGHAsIs
 hap1f0B1PoUyUNeEInV98D8Xd/edM3mhO9nRpUXRK9Bvt4iEZUXGuVtZLT52nK6Wv2EZ1TiT
 OiqZlf1P+vxYLBx9eKmabPdm3yjalhY8yr1S1vL0gSA/C6W1o/TowdieF1rWN/MYHlkpyj9c
 Rpc281gAO0AP3V1G00YzBEdYyi0gaJbCEQnq8Vz1vDXFxHzyhgGz7umBsVKmYwZgA8DrrB0M
 oaP35wuGR3RJcaG30AnJpEDkBYHznI2apxdcuTPOHZyEilIRrBGzDwGtAhldzlBoBwE3Z3MY
 31TOpACu1ZpNOMysZ6xiE35pWkwc0KYm4hJA5GFfmWSN6DniimW3pmdDIiw4Ifcx8b3mFrRO
 BbDIW13E51j9RjbO/nAaK9ndZ5LRO1B/8Fwat7bLzmsCiEXOJY7NNpIEpkoNoEUfCcZwmLrU
 +eOTPzaF6drw6ayewEi5yzPg3TAT6FV3oBsNg3xlwU0gPK3v6gYPX5w9+ovPZ1/qqNfOrbsE
 FRuiSVsZQ5s3AAMFD/9XjlnnVDh9GX/r/6hjmr4U9tEsM+VQXaVXqZuHKaSmojOLUCP/YVQo
 7IiYaNssCS4FCPe4yrL4FJJfJAsbeyDykMN7wAnBcOkbZ9BPJPNCbqU6dowLOiy8AuTYQ48m
 vIyQ4Ijnb6GTrtxIUDQeOBNuQC/gyyx3nbL/lVlHbxr4tb6YkhkO6shjXhQh7nQb33FjGO4P
 WU11Nr9i/qoV8QCo12MQEo244RRA6VMud06y/E449rWZFSTwGqb0FS0seTcYNvxt8PB2izX+
 HZA8SL54j479ubxhfuoTu5nXdtFYFj5Lj5x34LKPx7MpgAmj0H7SDhpFWF2FzcC1bjiW9mjW
 HaKaX23Awt97AqQZXegbfkJwX2Y53ufq8Np3e1542lh3/mpiGSilCsaTahEGrHK+lIusl6mz
 Joil+u3k01ofvJMK0ZdzGUZ/aPMZ16LofjFA+MNxWrZFrkYmiGdv+LG45zSlZyIvzSiG2lKy
 kuVag+IijCIom78P9jRtB1q1Q5lwZp2TLAJlz92DmFwBg1hyFzwDADjZ2nrDxKUiybXIgZp9
 aU2d++ptEGCVJOfEW4qpWCCLPbOT7XBr+g/4H3qWbs3j/cDDq7LuVYIe+wchy/iXEJaQVeTC
 y5arMQorqTFWlEOgRA8OP47L9knl9i4xuR0euV6DChDrguup2aJVU8JPBBgRAgAPAhsMBQJU
 X9LxBQkeXB3fAAoJEGFXmRW1Y3YOj4UAn3nrFLPZekMeqX5aD/aq/dsbXSfyAKC45Go0YyxV
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240319185735.1268980-1-leitao@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_070548_804397_A28CB722 
X-CRM114-Status: GOOD (  17.12  )
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



On 3/19/2024 11:57 AM, Breno Leitao wrote:
> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_device from struct ath11k_ext_irq_grp by converting it
> into a pointer. Then use the leverage alloc_netdev() to allocate the
> net_device object at ath11k_ahb_config_ext_irq() for ahb, and
> ath11k_pcic_ext_irq_config() for pcic.
> 
>   The free of the device occurs at ath11k_ahb_free_ext_irq() for the ahb
> case, and ath11k_pcic_free_ext_irq() for the pcic case.
> 
> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>   drivers/net/wireless/ath/ath11k/ahb.c  |  8 ++++++--
>   drivers/net/wireless/ath/ath11k/core.h |  2 +-
>   drivers/net/wireless/ath/ath11k/pcic.c | 21 +++++++++++++++++----
>   3 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 7c0a23517949..a8d89f510f62 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -442,6 +442,7 @@ static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
>   			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
>   
>   		netif_napi_del(&irq_grp->napi);
> +		free_netdev(irq_grp->napi_ndev);
>   	}
>   }
>   
> @@ -533,8 +534,11 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>   
>   		irq_grp->ab = ab;
>   		irq_grp->grp_id = i;
> -		init_dummy_netdev(&irq_grp->napi_ndev);
> -		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
> +		irq_grp->napi_ndev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
> +						  init_dummy_netdev);

Is not this going to be a problem with multiple network device drivers 
loaded in a given system and all using "dummy" here? While 
NET_NAME_UNKNOWN ensures that this is not exposed to user-space, there 
is still this part of alloc_netdev_mqs() which is going to be non-unique:

         ref_tracker_dir_init(&dev->refcnt_tracker, 128, name);
-- 
Florian

