Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D376C3ABD8
	for <ath11k@archiver.kernel.org>; Wed, 14 May 2025 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=; b=NeyLYQ2Ab3URYX9XG1BxsD73jJ
	A9sr+4ze6+Bx5FyxD7l68YPq98Fx68zAOsuHvjZjseonl/ouiTLHrwgffhqzTeubPFqM324yfJPcx
	TLBNRgFKqNF/thBP+8MdoEcxfflA5WVFwLXhHfqrfqHiE9HMK7pJGnTpdG8dTRbe0PLhDpu5ENrE/
	g5zoXkTxFPxJDVKwvUn8cWmGhjnVzsEdC9CLki+vPXrNF4slq0zrDMuP9gOtI39faKTJdeC+26QtP
	HvivfkJvaDFdOyKxBqaV+W1CthRnFT//vGEd2PrlxYKqtwKnJ3vt1D8lbJYGIWwxDOjuxQFghgB/M
	f1whn4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDwQ-0000000FZlV-0Cxx;
	Wed, 14 May 2025 15:22:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDej-0000000FVVX-27Fj
	for ath11k@lists.infradead.org;
	Wed, 14 May 2025 15:04:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuhj4002748
	for <ath11k@lists.infradead.org>; Wed, 14 May 2025 15:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=; b=SnyjUgcMMaPiVgCD
	oFEjYkHpDqi8YGI0JNGoBU4cXUMO+e3cN0NJt0WsFLVFc50Kp4bkekl6dleX9Ojx
	VDwpsGFprlflJ7p8p6Wsd9/isRitdV0spJXIgrbgctRdvkeyyAf7cf8JV2QsmO87
	mHgHf1uqoc5DwreAneJ+fCEFHDr9Xt0I/tTUYznSklSOzznR+ZBBh0+/5+V3VR8p
	6Fs/llfQFyzQ1OOjDpK2V5y6K/JtVCqSKtA0KqAthspWC/PR7mmkeafOGBl0z6J0
	UMG8Gl8kYDaunRcAOUgrmnd2lINQZ+sHtRgwUsP/sAWlJEFkB4en82FWxPy6gufp
	Jjo2lw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpb36y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 May 2025 15:04:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e540fa2d0so56097915ad.1
        for <ath11k@lists.infradead.org>; Wed, 14 May 2025 08:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235064; x=1747839864;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=;
        b=f3vof2N/yQlrWyPnW0FbHqjYk7oq6QIYe8OsgPbnjY4UUBlEU+ZTfFAwXW3ID2rgJy
         CxbtGnazjHP3oiW3rbGZb2szwfIr4XcKqS1Pw/ajoYK8VlbrfzclG8I+7IG7Uo+z04vN
         0FkB7XFm+Ow5Quegv74vKSekejPHmSKQHFjSsbDiJ/E9hRbvRcdPJCwfIMnKZVR/aTEX
         FvFCVr/ngbrj29wDklPyz9upWc+uxqhaie5SAzOaNW44HMC2fQZ+GnxaIVhJgVqSMUmY
         pL+zYYfCIqzzbsd8Ub/ZwbAwtYaPnp7/NxPlOEfHGN4Kpc7srX+efayFJ4PFLYbYpGbu
         FXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbeValbLZ8KRKgwxT17yMXqKDvp7Dp6LUuAM/gbpnaczkmalby6lV7zuu91hCGQKk81i/vd08=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBAZ6jDt2bRBipKUsTT8DTJZHI/G+YybEOJCZP0O1uDG3tF9vS
	SzAt3+XRzf172EKOd7EJqh1rJzlWolxkxTjNDV+5rrho+HORPhMGZBhU1e0AmV7+DLSQw9E3ddG
	NKzRbkG3ZRWpQWcj4d3nXrBxnSVlhOnFxfcvSH8C2hbdK6u3YF0FW7K7gatdt
X-Gm-Gg: ASbGncs4mNqO5vQDzK6X32KZiRYUAwk/IuPHeC2z0HK/OcWwiU2VPqVxEukoQ5P+ICU
	Bp1SAA7Jfzn/YDqYasu6IQAD+LiX5L8eIkM3YTZnNGI/3E+ip2iFuaE9SASZUxN98sCJUeAXSqQ
	U47fiwYCmiebhskTNaP9WU6zGwVXvLHtmGQJYD3IYqxWUerxoSxial4Lf1oJcHJ/jZxyxvTevpS
	fTErwixkkZXZnsUnxPT0O3QSz0Lqk/y5g7Pb25+ZNlvSaw6++jQanjKiLC11N+EE95xPLJZbDpa
	OlRRBkCU23+i9IF45thEJXbOTrjGcHIGe+L8HyLyIqFAFFWcQBRBCFShqyTQMZfITyw=
X-Received: by 2002:a17:903:1b06:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-2319813b0f2mr46446825ad.21.1747235063602;
        Wed, 14 May 2025 08:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjQ7t9o70lrzuaqlLt1wRe0tTalCwo5HCmLlKoR6bfnHAzYaJQ9Ag3++6SUvGsVhD0BfQ3VQ==
X-Received: by 2002:a17:903:1b06:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-2319813b0f2mr46446475ad.21.1747235063117;
        Wed, 14 May 2025 08:04:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829dbb7sm101127735ad.211.2025.05.14.08.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:04:22 -0700 (PDT)
Message-ID: <84238fd9-8270-487a-8709-c5d492e81cef@oss.qualcomm.com>
Date: Wed, 14 May 2025 08:04:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
To: Mario Limonciello <superm1@kernel.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
        Christian Heusel <christian@heusel.eu>
References: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
 <62cba955-0f4a-4b25-8ec9-065ccfa9e26e@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <62cba955-0f4a-4b25-8ec9-065ccfa9e26e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Di40Tg7JTVPRJC3ePY-ZGPopyceQe2MB
X-Proofpoint-ORIG-GUID: Di40Tg7JTVPRJC3ePY-ZGPopyceQe2MB
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6824b0f8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mehdgkVfAAAA:8 a=KSb9T-wMAAAA:8
 a=PjuYqXk4AAAA:8 a=VwQbUJbxAAAA:8 a=y1C2Jo8pdxxprBwrj4UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=J1pP9gvGZaT0y92QayzM:22 a=KF4VuIdXkMyp4E_ug72i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzNCBTYWx0ZWRfXwXaos1W0gR8z
 yLBGuIh7qk4OMC28krT84E1sBdQD0vFqaSmcCC5hdxmoCRA0AY8RAbRBEtSRWinyWrOFQ5P3//2
 rEbXf1snrZgroG2E+pFt1mrudo5wWeffIzmlpt8j7h/I5faQoTrmK/eUlQ25zgx/m44TexpMsYU
 bUD4H72MWrt45H/QcC9xSnYb021bkHUISwibrrNvA1dwnBj3YT4g9cV35WowjUZGFCN233sJ+j1
 KaBq64NyuqLY5Xfw78rZ3CEUBqG4mwjUrF5/kFnBEQXbcHs2xwZsKH0xN2nYPiRyJhUW3kTCioh
 BdTpJ5aDsuKWgdxEHc8BwYVw3VUU5V4iCdKnkhZ+FDGCTnJe1lI4gKuc3MOurAkD/yG5vRRgJly
 BSHs5uJODTydUscdlqAkdCKtvG+3vFyjjA05R4R2aDlsasvkfp8LD10qmJzYWa7KztAbm8X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080425_567548_9828BB03 
X-CRM114-Status: GOOD (  17.33  )
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

On 5/14/2025 7:33 AM, Mario Limonciello wrote:
> On 4/24/2025 3:38 PM, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath11k and ath12k.
>>
>> For ath11k, update the firmware for IPQ5018 and update the board file
>> for WCN6855. For ath12k, update the firmware for WCN7850 and update
>> the board file for QCN9274.
>>
>> Please let me know if there are any problems.
>>
>> /jeff
>>
>> The following changes since commit 490c0af1d6b9ffca0523edcfad27ba483b9d6da3:
>>
>>    Merge branch 'robot/pr-0-1745490027' into 'main' (2025-04-24 13:46:05 +0000)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250424
>>
>> for you to fetch changes up to ce13d29c3933f77674cf45855668485c48d3eba0:
>>
>>    ath11k: WCN6855 hw2.0: update board-2.bin (2025-04-24 13:04:20 -0700)
>>
>> ----------------------------------------------------------------
>> Jeff Johnson (4):
>>        ath12k: QCN9274 hw2.0: update board-2.bin
>>        ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>        ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SILICONZ-1
>>        ath11k: WCN6855 hw2.0: update board-2.bin
>>
>>   WHENCE                           |    4 +-
>>   ath11k/IPQ5018/hw1.0/Notice.txt  | 3918 +++-----------------------------------
>>   ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2334720 -> 2334720 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269220 -> 269252 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99456 -> 99456 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7072 -> 7080 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
>>   ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6429240 -> 6429240 bytes
>>   ath12k/QCN9274/hw2.0/board-2.bin |  Bin 1308544 -> 2626240 bytes
>>   ath12k/WCN7850/hw2.0/amss.bin    |  Bin 6000704 -> 6082624 bytes
>>   ath12k/WCN7850/hw2.0/m3.bin      |  Bin 299660 -> 299660 bytes
>>   15 files changed, 315 insertions(+), 3607 deletions(-)
>>
> 
> FWIW - this appears to have broken Wifi for a bunch of people.
> 
> https://discuss.cachyos.org/t/wifi-interface-fails-to-initialize-after-linux-firmware-upgrade-qualcomm-wcn7850-ath12k/8765
> 
> https://bugzilla.opensuse.org/show_bug.cgi?id=1241986
> 
> https://www.reddit.com/r/archlinux/comments/1kja6f9/ath12k_regression_on_latest_linuxfirmware_upgrade/


yes, the underlying issue has been found and a new firmware will be available
soon. (internal POCs BCC'ed)

/jeff

