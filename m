Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CEAC3ABA3
	for <ath11k@archiver.kernel.org>; Fri,  2 May 2025 05:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr0af+1fs+co45LxHXF52/9x/AZcZIXPX/7PByAtDyQ=; b=c6N0zAmKzURXgDRp/IIxpmhaxE
	2SfmkfMl8bH6fuqnNCf20CfQo3QfbU3JWnq7vCmdOR3cUcs5pO7L1hBhC/o14E74qhyO/Vk5m/BzZ
	ippFIqdtyZOc+Qp0ozNUEVeu1T7bOHU5Z2ZodFEWdY/dPQ7cGKHpnAjAr60yNN1zC0j33WIApPXy6
	bASRmEW8qhupev219nb5DPAGcCI4iTBpBoQswj93y4bPZhn0TJ59ayLG2ijQLQrVIRe7c5H0RPph5
	YDT9AG57O9KSmTc6ABLvzHpEKwHEfrol6mFv0E7DstedkQW/1eWNpMQQS/1ogIp56A8MYy5AZw7Zz
	+5V1qgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAj7u-00000000ulO-1qcQ;
	Fri, 02 May 2025 05:39:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAj7q-00000000ukr-0yMd
	for ath11k@lists.infradead.org;
	Fri, 02 May 2025 05:39:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NWpF016233;
	Fri, 2 May 2025 05:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr0af+1fs+co45LxHXF52/9x/AZcZIXPX/7PByAtDyQ=; b=fA1tskF3FivMPUSS
	BQjxlbrH30hdelfTXzeJJSXCJSq2vK75iAcxnWkUwWoRFvBorX+A2nGYgr9jcYl+
	BAI5kXvkRW9uUJ0DOc1bsvkoaxcTu8RYb9IrfqZlko7P/sM1kPB4Bn8VyDvk3B6s
	Ft02ArOY1R38ypSySSxjxWQmcp1HJa4fVxAzw8HUZGc/LEoKipufHIfm2RtXhn/y
	bMSz5pShK9wT6HtdQXRYVndqQUcfsJvvLflG7ZmUlQfnJ8K1aTxcTyKcDg1NfnWj
	6SQw+W0TSR5d+qwLrE5wHw/E+n90r2sp2sdfsjusFXZ/lMe/r5V4VBeAQfm333Mm
	9qdI6g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4fb4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 05:39:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5425dmhe008828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 05:39:49 GMT
Received: from [10.152.204.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 May 2025
 22:39:46 -0700
Message-ID: <15edfacb-4eeb-bc3f-72cd-4b7744c9da13@quicinc.com>
Date: Fri, 2 May 2025 11:09:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
Content-Language: en-US
To: Balsam Chihi <balsam.chihi@moment.tech>
CC: Baochen Qiang <quic_bqiang@quicinc.com>, <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com>
 <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
 <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
 <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com>
 <1d0682c0-ee5d-f2d4-199d-4ebc4e71f9ef@quicinc.com>
 <3660fcfb-be29-422b-a352-3996ad3fc41f@quicinc.com>
 <CAONkfw5-bfYRwHZ9iHhgJP2f8Zqyz5SZVbdL4n9EPhKU+=ONPg@mail.gmail.com>
 <CAONkfw7xjJjMAZSfHg5avEV=Bc5aJZqrRxMDvKWK4g14bLNjRQ@mail.gmail.com>
 <d4b01807-0770-439a-a77b-1e0f078687e3@quicinc.com>
 <07013bbc-296a-2403-a6ca-70de220495c5@quicinc.com>
 <fd6c118b-90ea-4d11-13d0-d8f49f9325e3@quicinc.com>
 <CAONkfw7z3QZORCMxOJAnzF0bLNmsZKfV3rOYEhStAK628dpq+g@mail.gmail.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <CAONkfw7z3QZORCMxOJAnzF0bLNmsZKfV3rOYEhStAK628dpq+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PDvgQKOfvrG_OCgcrW5h7CScbe1FbqcS
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68145aa5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DJGQCCccBhpFZglK8sMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA0MSBTYWx0ZWRfX1AFhKBswH2m2 ncdtMB5iMNMJxpR+Aigfz9mHknPZjfcoaRcWNUuLGTjqPoFa7QvVbGtSTWhQuNZHsvTmGkaAT1d DNog3Vr4Fj6/MLT1MjeiK5HWkv6MQEvJwiHV62y9bK08HIeMw7jruoWlpQlzWR9h0+6ZckBe63y
 3eKJQEno0LFJM2h0rwlA6AjmJ00ggdu7iz13JhwZBPUXLOjPwaMmbthf4DtCoucZuHY2Y2vfPGT Zh83MKoN1aGxtwusuiJTPSgV6eO30t28e7xlrToOobQaGdB3ILaxqYFC74to2TIbB2OdvMMpWCo SC2CPiKBnI+lNuxjiqmoD0TujE01GvYRQBvo3SqgNBIaMvDfCI+llHeccIN3bVAKGxcjGlV64oh
 upfHhXEeaiZrMhDma4+m/8q72ulCW6t+mjIHTHI3jAqfHQG1tvZ+8zce3HUqQNjkoUjmZ4u9
X-Proofpoint-GUID: PDvgQKOfvrG_OCgcrW5h7CScbe1FbqcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=937 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_223954_290137_CECF3840 
X-CRM114-Status: GOOD (  17.09  )
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



On 4/30/2025 7:34 PM, Balsam Chihi wrote:
> Hello again,
> sorry for the delay.
> i did further debugging and the i found out that in
> "drivers/net/wireless/ath/ath11k/pci.c",
> "static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)",
> the "val = ath11k_pcic_read32" calls are causing the kernel crash.
> by removing them the driver is working properly.
> so to answer your questions :
> @Baochen Qiang:
>> is this instruction causing the synchronous external abort? which src line is it pointing to?
> the src line is  "val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);"
> and any "val = ath11k_pcic_read32" in "static void
> ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)".

Thanks for the information.

Just to confirm, so you are saying it worked when you skipped
val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR)  alone but
still keeping the rest of the register accesses in ath11k_pci_clear_dbg_registers()?
Or you removed some more register reads in that function? May be you can share the
code diff that worked for you.


> @Vasanthakumar Thiagarajan:
>> i) Was this working before for you and broken recently or it has been
>>     like this since you tried first?
> the crash exists since began working on the project with the same hardware.
> also earlier versions of openwrt has the same bug.
> samething for Yocto kirkstone and scarthgap.
> FYI, i use two different QCN9074 chps one from Compex and the other
> from 8devices.
> both chips behave the same device_id=0xFF and they both crash because
> of this bug.
> so had to load different board-2.bin (provided by comprex and
> 8devices) for each WLAN device to have 2.4GHz and 5GHz bands.
> default board-2.bin (provided by linux-firmware) did not resolve the
> kernel crash.
>> ii) Running into same issue during rmmod of ath12k driver instead of
>>      reboot?
> both rmmod and reboot of the ath11k_pci driver cause the crash
>> iii) Is it possible to attach the console log during reboot also?
> rmmod and reboot are the same logs i already shared above

ath12k logs during reboot showing register read values
in ath11k_pci_clear_dbg_registers() will be helpful which
was not there in your log.

Vasanth

