Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49B7CCD1AB
	for <ath11k@archiver.kernel.org>; Fri, 24 Oct 2025 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko5SimEePLLJ6GS7G0bMFIim02Te8PTyT5lApRtcKXs=; b=Rx1XFhVox+T621VHe2MS440s0k
	uJAWzkKS+CePOqe8nEU8dHUSkVE9RpQO3jf6pPPqzy3D39ZPLUOo6wj8GfTNU2bXd9AWHJ8/8dHeg
	CVwWSfYNxXtyvx3hryADQZ03CpPoE4aqgY5pObJni98n/pnEod0ed6F3dBqbzCy2+fuBjgNqxTEV5
	arusn4c7XIgocLUKG4GbtFYgGwQseG6wdsNz9sys2+ysznHPaBM6qdo84OfOf2fwYQN2sM2cYx7rM
	E+qFzU9yGvYNdB9yO2W9t7RbM3dkaGPpqcySCzwlvVAE9F2DBqRuzN0wCiAL7Gno96lDjX/tcwOh/
	DEq1Gjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBtR-00000008Pzt-1jps;
	Fri, 24 Oct 2025 07:07:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBtO-00000008PzN-1DJW
	for ath11k@lists.infradead.org;
	Fri, 24 Oct 2025 07:07:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FPlU003425
	for <ath11k@lists.infradead.org>; Fri, 24 Oct 2025 07:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ko5SimEePLLJ6GS7G0bMFIim02Te8PTyT5lApRtcKXs=; b=VV1fr2nVHjIbX2wn
	+nmKtbVd7F25iKkFwmnkR1SX4wxwCN83HekLBOhEqVwc926fxzfgS7El7qCAA/km
	gPZRnm9HvIZXQOzHD5kH8uLkuFQbfmyusIpXpD5k8Oe0HpO3svTBx5Lg5lvs65de
	75BmHLsD5SwCWkSqdrekkVb4/vVcThAsHA9bu4dkD1Y6r/U8UcWWAg7O44nE1ieM
	HanVacBRHcweqCRv51vzaQQjD+5hH4O6E6M8LivcfA0bhU15XMR6xoPQx939Xrf2
	2yCMjxbX3Ff3TLDeOpJ8KRUrassDRKTd4ne5JUxcNL6JkO83J3Ci965HFXhRyXsi
	6/30DA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jb1gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Oct 2025 07:07:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290cd61855eso15793575ad.1
        for <ath11k@lists.infradead.org>; Fri, 24 Oct 2025 00:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289635; x=1761894435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ko5SimEePLLJ6GS7G0bMFIim02Te8PTyT5lApRtcKXs=;
        b=vcJ/09tgh/RjWxJ5hcI6TvldCksUHgFJ1NnvQT3dS1FUJ7/BU93VjHPhmkaZrEmNve
         0yPUuEHAZuC/cdZQ7loaqqlsRx7igNr5PeodmH+e8DK8oE13bo0Ujsy1fItAl3RMWeMo
         wNgsWwBzSu1heG16f0B07zqLLf26j63v3r6ihCUmJby+u9rPzNl+iG0iI0tLlBFnfvcU
         B6/S9beLvSDYr5g93IPNZD805a27z2HqkwB/BQoQpIBVZ0SWMdcrzbo7YQVOmjVFFBuL
         QhVA4pMgnoxHkiYAPnZ5oztkXC19iXfFx68uU8q7bnkCecypERTvEL41Wk8xlqtGR/gd
         tZvg==
X-Gm-Message-State: AOJu0Yz2ChnA0WUGLtisYMz/QchNVbu6JJkBq09g1ErH1AGgbvuSEYrz
	jxxm6dUbzFjZKJtXPS2qxeRY6WbUf55ZkMYht/wQmjlFUB1fEHZaBwaec+zPtyPyYTwDO6MF6Mh
	YxkI6l/DT7jnhsa+Nf4gpW8s736ZzoIlwhBfmoLiVqHfwhITdrTFY7DVd4wvmn75U
X-Gm-Gg: ASbGncvTCCxT85exq5vGLUcJentb6NOnwCQ1EpwFrF5RZ2ENdNBmYqMW+ci0bJeJYqx
	+iMwGpibhuDPCbMcsGLYVlBJNEqtqsO44KdHOWgylJj5zfOY+Xl+Gz54aAJte5yvP935G21NRFv
	tamTzsVZN+ZCOeQHQqGavg96Csh3F6wyVPUf1aMu25SceOCd5ZkaPZlWN//KJVMHD6Kc9H12zRh
	iQUklHSkI+j0FYW0Bml9fyJtgxOPm23qZ7aDIZL1RE/3o66U9RMkpZ0WBjFsgE6hKuoYd67E4ay
	zXgvTSU3supCUxd5r9BgY4W0a3khhLtGPXqg2xm3opFjoZvXQu99aJzfhaJlR2qa989tCTCJdQs
	sZtZMQwaRokaRIXtauUVCYwrc9KqouA2ubfjqBe7kq6N6
X-Received: by 2002:a17:902:d485:b0:28e:c75e:61d9 with SMTP id d9443c01a7336-290caf83210mr339202255ad.38.1761289634910;
        Fri, 24 Oct 2025 00:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpjDqtmIY8KYoEtsIUjtyeDBFRfjVSWzDtI0305kFIDsn9sxrE/2lcbUSvr5ki+8iNgFXhtA==
X-Received: by 2002:a17:902:d485:b0:28e:c75e:61d9 with SMTP id d9443c01a7336-290caf83210mr339201955ad.38.1761289634150;
        Fri, 24 Oct 2025 00:07:14 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f0654sm45984795ad.81.2025.10.24.00.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:07:13 -0700 (PDT)
Message-ID: <8036e502-9058-6f16-8016-f2a14e57ba69@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 12:37:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: QCN9074 load board data file failed
Content-Language: en-US
To: Doug Brewer <brewer.doug@gmail.com>
Cc: ath11k@lists.infradead.org
References: <CAG0V13SM5VN6sfr_iMFBSHHOLFbW8-WK3=B-vt9qgE5nu0CmaQ@mail.gmail.com>
 <4489f5ee-25cd-8547-88fe-148a9b8f181f@oss.qualcomm.com>
 <CAG0V13RUPG01MLqEYaW3NNs86z7fo5OXAd-LvH+y3vCnAT+cgA@mail.gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <CAG0V13RUPG01MLqEYaW3NNs86z7fo5OXAd-LvH+y3vCnAT+cgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8glk/qJpf9+s
 t/k/Mep/RHRuVMVvfvBpvuTQIhLtXlGvBDOv6R+IyDxLBVDrlTGvIrCOAMcTOG2ZlDhGCCfuvXx
 b2tUkcaGbP9BGcln+Dk/arUwyinw1YWJ8SzF4xwbUB/yzdBO4IMhl/13j//C/yVJUXwi/gGrSEg
 VPJOO6vOW0b8gret9PzZioeBZ1AbhrNbSdYyLnTQE7gt7Ovj62BgGUWqYkuOrDgVp5TF0+eT51R
 z1PEusUbYfjERJ8q4Zfh8QUJLfTMCh7unFmAIi/kwN4pFNu1+dwhaEuyuIyQGROS31TLX8hRJCM
 LADO3ykDB3ft99xwG6oJfdp8P/AfpTbd8OUH37FP4bSB+eCDZov3QmCwRBNFMsSAgf5+u3mhdaz
 inTMcoM+tB5f9xl8kkob7ZrLU0EO0Q==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb25a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=wk9cMdQ4HunJ5UQ-ahsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: 07EbrZE7YXSaFEhYGaxYE2Q3PQ8LM32b
X-Proofpoint-ORIG-GUID: 07EbrZE7YXSaFEhYGaxYE2Q3PQ8LM32b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_000718_447253_4F31E5B5 
X-CRM114-Status: GOOD (  16.58  )
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



On 10/17/2025 6:38 AM, Doug Brewer wrote:
> On Thu, Oct 16, 2025 at 5:37 PM Vasanthakumar Thiagarajan wrote:
>>
>>
>>
>> On 10/14/2025 7:42 AM, Doug Brewer wrote:
>>> Hello,
>>>
>>> I’m currently running Linux kernel 6.17.2 on arm64 and testing the QCN9074,
>>> but it fails to start up.
>>
>> Was this working for you before with an older kernel?
> 
> 
> Yes, it worked with kernel 6.6.

Odd, between v6.6 and v6.17 I couldn't find any ath12k changes which
modifies the caldata download path. Is it possible to share the kernel
log with ath11k boot time debugs enabled for working and problematic cases?

modprobe -r ath11k_pci

modprobe ath11k debug_mask=0x1060
modprobe ath11k_pci

> 
>>> It seems the issue is related to loading
>>> the board data:
>>>
>>> ath11k_pci 0001:11:00.0: BAR 0 [mem 0xf2400000-0xf25fffff 64bit]: assigned
>>> ath11k_pci 0001:11:00.0: enabling device (0000 -> 0002)
>>> ath11k_pci 0001:11:00.0: MSI vectors: 16
>>> ath11k_pci 0001:11:00.0: qcn9074 hw1.0
>>> ath11k_pci 0001:11:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff
>>> soc_id 0xffffffff
>>> ath11k_pci 0001:11:00.0: fw_version 0x2403072e fw_build_timestamp
>>> 2021-06-06 23:27 fw_build_id
>>> ath11k_pci 0001:11:00.0: qmi failed to load CAL data
>>> file:cal-pci-0001:11:00.0.bin
>>
>> It seems the calibration data is not found in the file system as well.
>> Since calibration data will be specific to the hardware module, you
>> may want to check with the system/device manufacturer.
> 
> Because Kernel 6.6 works, I suspect that ath11k has changed its mechanism
> for QCN9074, which now requires calibration data.

No, as mentioned caldata requirement has been same since 6.6.

Vasanth

