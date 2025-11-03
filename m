Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C9ACCF9F8
	for <ath11k@archiver.kernel.org>; Mon,  3 Nov 2025 03:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcCvOyYpj5kIxZcWJPVz3ndDcWqWgYyyK6gtYhwd2B4=; b=j/rohFrjhO0WeGm0oj3DQPASz2
	LT5NMnquEf8zWPpnKgPLkbcYpkLk/7vyFRmunTuy0PX5le6k/IMuAAQZNCDta6rJj5QUX2vuCbXYa
	SbW9DJNgyHh0Uhz4gnUEqeGPO3wO+fieggG/IY1hsE4i6sJ5KaGnJJF4T2up5HrUiOy1NP0Lkj5Vx
	+I8EAS0Qm+gG3skrYcGWHrnCtg7zSMUvEJH5d59TFF9hUqHzoEzWbcjb3XRtDtO3mbUGEeBAqi3mw
	KgLiMHGzyLUH1l5thZGMWudFDsQc0dGcf4esR1CRqzu5jeKo4ygEfYhFtfRfuylGEPyPnU0MYWA8R
	s3oAxWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFl1R-00000009707-092k;
	Mon, 03 Nov 2025 03:14:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFl1O-000000096zd-2oqt
	for ath11k@lists.infradead.org;
	Mon, 03 Nov 2025 03:14:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2MF1711462744
	for <ath11k@lists.infradead.org>; Mon, 3 Nov 2025 03:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FcCvOyYpj5kIxZcWJPVz3ndDcWqWgYyyK6gtYhwd2B4=; b=Ae4dgChw2X6r1elT
	jMJK9GAiS2n+kcmD9/HMohZDjKahoCyoYkd0RHKBnbIlg8bTGIXxQOc2ZwqZ/VZi
	eX+24OH/xvAX3x9RUnqcVEVElNPfN4B/O53zW0hbQAh5ewLlygCJlm67pwljiF29
	Ry4s0gggPiXOOM8VsoPg9WVFY/mNYIadqhwl9/qoAIDRGN1zEHOe3hPKbTWA+rXw
	88gwXqqLFuxCx+lQx3acCGhe/72LfOOGtZhDteXkbWqxi+IKSCXkdTO+9bH8MH5d
	uYbLf6y4BbXEvpiB3i8d5T3rPVZMseAO79bxk/z1c/i4F4F2ZaUD1n/vUACD6sVE
	FzI5SQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5977b7ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Nov 2025 03:14:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so13566675ad.1
        for <ath11k@lists.infradead.org>; Sun, 02 Nov 2025 19:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762139656; x=1762744456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcCvOyYpj5kIxZcWJPVz3ndDcWqWgYyyK6gtYhwd2B4=;
        b=XEaRcYNgJ21FtWaXe/khQQS4s7LAd8gzynq9KXk/9V2mVu+0sHPyJqxHfhU6nTwXbc
         N3ysNhCaqH6ybmU2j6bwwmvp61bOuhhU24LgXY0Yb+XzeWClzaWgY9N930UPM+OG+DKB
         SMyHo2xrnW7dZ5ZDE3bhKNTnOeJyYtBmQQ9vUJMntx4XxdN1N71mA63pCAFvcdyR66HF
         xDsSN9Z/9O6fx9daFK3NfIMm41kO49tJgoKVoiGUQPrcvX0fconR/RTwmEt0RAvoppvJ
         5+SGUcE9p0fxo6yZl5tl0MSj0xF3LgNNkkrne3KQ0HRemgfVvKvIYZcmqWQg6G1N3Q+R
         qUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139656; x=1762744456;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcCvOyYpj5kIxZcWJPVz3ndDcWqWgYyyK6gtYhwd2B4=;
        b=GTUBhldVT7HYEDWPmMpxxnV1pxCHPGZLEvU8K6VW4uOGgnPb4xxej1RbozZ6ZjgOsK
         PiTzXqDR5vldgiVz6XQIBfmTgAQ7RcOARSLbdnNp3B07wHYhnVhfIstAoE9QzxXNHBml
         sBv0bvp0KvNFE7inXtY7BDVt9qUdiGn/eV6+quIzZRw5YptNKCQ/o1g2kEY2dntvy3xZ
         YII37oaONxuecjzSSiq2cI4HAwZXIqILOep7Npe4+ZCAuM6Yb1EgNvyPbMxFKJ1ZGVZG
         G2mGym9IrSSBMn1Z/MaQm711DRAkTw4bJXSbliYhy6PRZOV1dF7d8yPscSquOi+79FXe
         wSeg==
X-Forwarded-Encrypted: i=1; AJvYcCXDp3Y0v3pQUxIEnl2/+IkTK0Nb3wwKja2b5d2pQDG6IcFeIA6zCt2EoLB18qL/eFNroSCrM5Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiH5etwHjtTgFWeMsO3zqGE9B44IOk8gsNsvgHiTrOJfiuFpxg
	XhDqGy5zEELrpQ5ZAXXv5R4JeJAtMaikEoNWUlJche9jLy4XCCHEpCXoawGfBUJCt+Wa1ary7bd
	5G9J6MFmq+tcOlDm6EBUz/YKFWXKX7UKoDOqGNnRvW3YYoUECB0D+umR8Gv90ZytE
X-Gm-Gg: ASbGncvuHSnT/xr3kVeduX7p0NPRkOajyxYYM4kdwIjspYDht819gP2eP+zknbioOGY
	nZ4+kdUeMwLIVRjQrn7j2PBEjysNupye0PcMf5m0UQUYYNa3EWLgyKvfUJu+brVY3TGX6ATVb2x
	I2LJUfrtT4mpi5OV8qciFqTG10aBMUtLlA1tpT2fTpFaUGiKGpuqSz6GAkI8pwNB0NTDnrnWUnH
	8sK+XQI9fKSwJPDBTk8La7Ln6GLxDDHl6rnv9PHSDAXnNyCFCe7gVDT4Yn/nn2eHiyJvV0MyUuf
	ccA97G9KXINrcLZmWmFXsC9bAx+i6Cqj+TX/Tv3wWrsxFkwGGYX4lFGXqOVmIH4Af/Y3p5aqM9P
	K5i8pd9ZeXNVh8+g2RRLHuzExGywLUooNnPkXwdwWxixK4mlsR8QupFT/UVmVLHcaNf+O7iY=
X-Received: by 2002:a17:903:2f87:b0:295:615d:f1d2 with SMTP id d9443c01a7336-295615dfc5amr74639515ad.48.1762139656395;
        Sun, 02 Nov 2025 19:14:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4++0FISgdbKE49ZuiNLI8Dj0TWTNPlqyMmFrX5Wook5O8KJn7oUSf3QxBDSlk3adCE2YEcA==
X-Received: by 2002:a17:903:2f87:b0:295:615d:f1d2 with SMTP id d9443c01a7336-295615dfc5amr74639215ad.48.1762139655842;
        Sun, 02 Nov 2025 19:14:15 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269a8ddcsm99033685ad.91.2025.11.02.19.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 19:14:15 -0800 (PST)
Message-ID: <5d0e6d7b-d127-46be-8985-9be33a490aa0@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 11:14:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/6] wifi: ath11k: Register debugfs for CFR
 configuration
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
 <20251030043150.3905086-3-yu.zhang@oss.qualcomm.com>
 <0b4ce00d-78eb-4b5d-88b5-7d5b8de663a0@oss.qualcomm.com>
 <0a05ccf8-8850-430c-b008-52b3bc2df431@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0a05ccf8-8850-430c-b008-52b3bc2df431@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YhqZFkTotRYba_VnkRF8UEedn-e3C1TY
X-Proofpoint-ORIG-GUID: YhqZFkTotRYba_VnkRF8UEedn-e3C1TY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDAyNyBTYWx0ZWRfXxFONsk6CK+Ax
 lri4Xo/wRaqaky1/n9/A91mOwxwsMKkRG+lomW2LVQJp84kfOY2rJXo6JxjY+yjXEtS4g6x+RuP
 6zvMqf6M9zhiPoK4L0L1WPqeseXvFCszWRCVCylywVPpciw1A9Vwt4mWYtN8q72jo3tN7khVGlA
 mZlE3x5c1bu90sh/qD+SlfbKtm7MRuMvxLF/8Qe5WhdRBdpNOnGBN5nbKNngndFx33nZpPrJjNs
 Jcab7ZINUdkwwXHWXIObhUDk1kjrufSv8rLZt/W80kBsDQKJwLtAS0hu7stN1dKqYUPHmWdD3cj
 4vTqxHPzDJ/g0lN/zWDc1uNiYq4kucF/t1olS3ZVmo8CkmJ5gmq3fpVRWwcMjJ70pCwwXFDaqkT
 GtLb/70i9dkWazReZ2CCQv96V0VZoA==
X-Authority-Analysis: v=2.4 cv=WcABqkhX c=1 sm=1 tr=0 ts=69081e09 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FMcQbdABRIzOJQOt2JwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_191418_834607_88BFB759 
X-CRM114-Status: GOOD (  13.86  )
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



On 11/2/2025 5:21 PM, Yu Zhang(Yuriy) wrote:
> 
> 
> On 10/31/2025 10:43 AM, Baochen Qiang wrote:
>>
>>
>> On 10/30/2025 12:31 PM, Yu Zhang(Yuriy) wrote:
>>
>>> @@ -88,6 +275,7 @@ void ath11k_cfr_deinit(struct ath11k_base *ab)
>>>               ar = ab->pdevs[i].ar;
>>>               cfr = &ar->cfr;
>>>   +            ath11k_cfr_debug_unregister(ar);
>>>               ath11k_cfr_ring_free(ar);
>>>                 spin_lock_bh(&cfr->lut_lock);
>>> @@ -140,6 +328,8 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>>>           }
>>>             cfr->lut_num = num_lut_entries;
>>> +
>>> +        ath11k_cfr_debug_register(ar);
>>>       }
>>>         return 0;
>>
>> miss _debug_unregister() in the error handling?
>>
>>
> The documention for debugfs_create_file() tells us:
>  * NOTE: it's expected that most callers should _ignore_ the errors returned
>  * by this function. Other debugfs functions handle the fact that the "dentry"
>  * passed to them could be an error and they don't crash in that case.
>  * Drivers should generally work fine even if debugfs fails to init anyway.
> 
> So IMO any failure to create the file should be ignored.

Maybe I was not clear ...

I was not meaning the error check on ath11k_cfr_debug_register() or debugfs_create_file(),
but was meaning that in the err handling below it, _debug_unregistered needs to be added:

		cfr->lut_num = num_lut_entries;
+
+               ath11k_cfr_debug_register(ar);
	}

	return 0;

err:
	for (i = i - 1; i >= 0; i--) {
		ar = ab->pdevs[i].ar;
		cfr = &ar->cfr;

+		ath11k_cfr_debug_unregister()
		ath11k_cfr_ring_free(ar);

		spin_lock_bh(&cfr->lut_lock);
		kfree(cfr->lut);
		cfr->lut = NULL;
		spin_unlock_bh(&cfr->lut_lock);
	}
	return ret;
}

> 
> 

