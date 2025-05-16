Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA94BC3ABD8
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 23:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFoa4Wt+QZ3pFcP+ILpeQXCXFqPuy/ptUQhsGsvDh5g=; b=gnHfBroyRYsZjXYeBu5/uHwK9x
	u65uHS7jQPNBP+WP/hT8Pc1PlM/b5gntR4qWNnGSFtHagLAgMFYGUsaGNlJ53E9Nqx/YeOXGmCtcm
	Lrl3mVfQLBk6NP6QL16CJrkW/hwqRnuFi/PBzxxURCNelnfgUeiUsyGp6RxWN8Ro4PmoFF9NfUuL4
	DLhj4BRiD6O/gSNXg54U4U6Ccvt2Sm/aMxKk8nuzv7+fHn1osrehFObcRH4WCi8s2eKGcLMaGBdK2
	LXe9dQb0la6IkQovXvmCJw3WlDZtHlCn+pk//Ci3HFzuXK1mBCSnnTjTEOudUjidcP70EAIFX33UJ
	KLxCdXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4rj-00000004sql-0qx7;
	Fri, 16 May 2025 23:53:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4rg-00000004sq9-1ONg
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 23:53:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCH28O014002;
	Fri, 16 May 2025 23:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFoa4Wt+QZ3pFcP+ILpeQXCXFqPuy/ptUQhsGsvDh5g=; b=XuImnwhxYi48Dy9p
	6mwr/f6U1U3DBazl1Z8WbX4hbGNKmg0OA2lwjdy1phSv1G59zUIUUOULXKKhGHoa
	7pwnlVAhj8lPGpfrHkIN4XBJAhOholorz4k/dsCYaqyQ8Db2qVdPqETzABmFGqt9
	3/WkdHesZW8PBAKHIQt0kg/IpofJPE2LY1+lcxbNKjxMeODnvUZnwcATLtJhgGV/
	3eBNeMSyqyQawq0P/ypKs1nb5zxBPDytfZjFxhOmWmGndM+ry4ET2vMGaVXxT7Aa
	ARHVsDg9YGizQTB+zZ8lUbwZDSM+A7z1DRDHs9hv8KhJCmm7FhFHnYEQ2Bm1aIwC
	G34X+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jtvmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 23:53:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GNrGsG021491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 23:53:16 GMT
Received: from [10.253.38.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 May
 2025 16:53:13 -0700
Message-ID: <86eaecde-075c-46f9-91ac-111a60606d95@quicinc.com>
Date: Sat, 17 May 2025 07:53:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <quic_thanson@quicinc.com>, <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <jjohnson@kernel.org>,
        "Pranjal Ramajor Asha
 Kanojiya" <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
 <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
 <5a90a869-8bc6-4fc5-a02a-58579f24dac5@quicinc.com>
 <ea1336e9-768d-4393-bf88-d4c3f19db1b8@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <ea1336e9-768d-4393-bf88-d4c3f19db1b8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6yW9gCaifL4dn_KEI895JgenYBZB3vl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIzMyBTYWx0ZWRfXyvYiLXTcpl7G
 E11XiqxoL9CLqQggTqisrLHQLhWxhhS0S2akF9NkQjfSg62W/zqxrtX27Cp5P60ifbu6GndnoSB
 iOrjz482D/X+rM+MYYd6bZyIpZyzCQTcn2XBuE7te6sLHuAUGytlzTmoiMo6tO0DxlLTRoVSxC6
 BZ25HmUI1Yr52cChKXFfl6H4fPnjbfXqMuV0A/s/zAeF6gMweadw8foZbIEmym54I0nbkNfpepZ
 KsbqDhPtbsXBGCVE89vFWwzpOI9mdxYCPnKMA4YXvrvVtJGcnp0JIxsjvQ6g8+bBq0bzEvMVcvh
 brc59GFCoafVKouxM0ha1VqhVszstXqD2o1dKFdyADx1JHa3cTpkkB4jxFwnK+tzI1u0RpAwKdK
 3Fp5yHJQ2RQXr28NS8AktcRJea1tLjS1N1XxFR8XVMBb9obDgowXxjNWYUj5hN5mRNplJ6l5
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6827cfec cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=zZ7Eu0Lr8_8K3KrLzEMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6yW9gCaifL4dn_KEI895JgenYBZB3vl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_165320_384582_4C95B323 
X-CRM114-Status: GOOD (  16.43  )
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



On 5/16/2025 11:09 PM, Jeff Hugo wrote:
> On 5/12/2025 7:43 PM, Baochen Qiang wrote:
>>
>>
>> On 5/13/2025 2:31 AM, Jeff Hugo wrote:
>>> On 4/27/2025 7:57 PM, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>>    int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>>>        struct mhi_event *mhi_event;
>>>>>        void __iomem *base = mhi_cntrl->regs;
>>>>>        struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>>>> +    dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl-
>>>>>> ctrl_config_size - 1;
>>>>
>>>> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
>>>> boundary, no?
>>>
>>> Its possible, yes.  From a practical standpoint, that seems to be unlikely as the control
>>> area is not terribly large on supported platforms.
>>
>> although unlikely, we need to handle it, right?
>>
>> IMO a possible solution is that you allocate (2 * ctrl_config_size  - 1) bytes and take
>> either the former half or the latter half, depending on which one does not cross the
>> boundary.
>>
> 
> Ick. That is going to double the memory consumption for the lifetime of the device, and
> these are dma_alloc_coherent() allocations which usually pulls from a special pool, making
> it a limited resource in my view. qaic has usecases for 128 devices in a system, meaning
> 128 allocations are now doubled. That feels excessive.
> 
> Trying to allocate again may introduce fragmentation, which is also something I'd like to
> avoid.
> 
> I'm working to get the spec updated to remove this restriction, which would then mean only
> "legacy" devices are a concern. As far as I know, the number of MHI devices that actually
> require this handling are low compared to the set of all MHI devices.  Therefore I am
> hoping for a balance.

Really not a fan of such balance, especially at a price of breaking legacy devices.

> 
> -Jeff


