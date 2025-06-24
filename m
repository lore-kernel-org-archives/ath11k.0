Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FA2C77B7C
	for <ath11k@archiver.kernel.org>; Tue, 24 Jun 2025 02:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQUdPPfct8mwW0ApkYrYtEC/iPMH8KqKsaWj3JKLFeo=; b=PsRsEQ4O5tqT7IT1nk372UrLlI
	TMInMbm4fhv7Di73/ANXANkVB5gK7a5ypFdUl5hMa0HwagcZ9t0e4WNzipXswaivWSlxC6yvZu6If
	HylI8gsf191XHi0qyWfu7uYtMg2FRkg2vqoomr9PHM9bwU9P4EC8lMB0pyKBn2HWoQ0oQI+7iIcsJ
	PyIYXOjj0PFa4extHiSTMMfzSFQ+8C56tsMbhbkLWaveMmCeIKDoAdLlNYg9SVz6ktcq44D/pV2pY
	jUv/tw0OK2UHEhtg6FfWa/TE2Pnj2nXbtdy/tdPHbDPo37vtScZZJztxTR4VwWSy+bF5dze9wQCvp
	ina1yrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTt8b-00000004SKJ-3DI1;
	Tue, 24 Jun 2025 02:11:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTt8Y-00000004SJx-04TA
	for ath11k@lists.infradead.org;
	Tue, 24 Jun 2025 02:11:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlEpK021903;
	Tue, 24 Jun 2025 02:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kQUdPPfct8mwW0ApkYrYtEC/iPMH8KqKsaWj3JKLFeo=; b=LAZm6ZypNY1a3TJS
	Gs5tAcq1HLlINcsIN1kg7UJdYN3KW0yvbDubrlxpdT8vo4rWTFb65NrnPnfEe1T9
	J5uPAnUCCF1XnuwWdlH0Rn/m5onqbezlQe4u5OOwoOJfUuAKeNGMJT4l7gZ+bo7/
	ixZzMda2WA8LfGw2d4nCq2UFyU8Z0EJWbExfg911xzYs4cQSO36oHOW4ln/oDnof
	2k6oErEuWMGem+C2zW2Z06Mn/L1iBHLjJNNCP+Yt8qXFSZS706YWUPtJ8a6iQXfV
	P5uElwYTRBPgb9eYyUSF3EUa7iYRyWY+5t9ROya4RJQ39MCTBBLVQJnhOPqHAX+W
	IIA+aw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgah76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 02:11:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O2BiPH010778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 02:11:44 GMT
Received: from [10.239.28.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Jun
 2025 19:11:42 -0700
Message-ID: <5b77ff7e-13c9-4083-9273-b8d3050e5116@quicinc.com>
Date: Tue, 24 Jun 2025 10:11:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
 <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
 <51da74b0-d8d3-4520-9fc9-06b50b552bb2@quicinc.com>
 <08a310dd-6982-4e63-9f6a-02bd9d579167@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <08a310dd-6982-4e63-9f6a-02bd9d579167@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FCtXXJNbWgFx4ZC3Tl9VxloQmdkGSe01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfX5Lqu7XEkkwHs
 naANXP7YJGSGmLElZ2izECRr4TRKngSbTDdSLnPFrlGzIz+g2vrB76GWT7fFdWotkYWVbgAH83V
 0N/6bdC+RBR7E4flDMwXnC2Mh+44PONSjBbqZYHTtxEW8z8LLo63KTVMbnNCVjPHreMyQLmDNg1
 fN+owkJAsZv2HcMFlMddv/mPUB9Emqr9/3nh1tsamuwzcfLAZaRWkycMcfRwskcyjawakwh2KQB
 8XaIXRCoZwqQrdx3kzrl5x/6jOWWJ258x5E2LvJyjGu1Ii1ePF+1tMtVJzXdYoAHiSBtImFR6vB
 Ms21U8YW1QQ84qg1yCtHJ6XgQBR2wkDJwGq8dgJV5yTAYLQ/tCXDD57bPHzTicMVe4hPWPKZ2Hk
 y4outvOGjNAq4UhqlLzDm0YRG5lE638/U2b2dipOwdDVWXTmDDixodoffZ0Xns+a79boQfSV
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a0961 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=FTT0Ydu4DhEltKgSIdUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FCtXXJNbWgFx4ZC3Tl9VxloQmdkGSe01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=889 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_191150_211188_FEB851E0 
X-CRM114-Status: GOOD (  12.86  )
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



On 6/23/2025 7:30 PM, Konrad Dybcio wrote:
> On 6/18/25 4:00 AM, Baochen Qiang wrote:
>>
>> On 6/18/2025 8:15 AM, Konrad Dybcio wrote:
>>> On 3/28/25 6:32 AM, Baochen Qiang wrote:
>>>> Now WoWLAN mode is chosen for those machines listed in the quirk table.
>>>> This works for suspend (S3) but breaks for hibernation (S4), because
>>>> WoWLAN mode requires WLAN power to be sustained, which is not the case
>>>> during hibernation. For hibernation, the default mode should be used.
>>>>
>>>> Register a PM notifier with which kernel can notify us of the actual PM
>>>> operation: if system is going to suspend, the original PM policy is
>>>> honored; while if it is hibernation, overwrite it with default policy.
>>>>
>>>> To summarize: for suspend (S3), WoWLAN mode is chosen for machines listed
>>>> in the quirk table, non-WoWLAN mode for others; for hibernation (S4),
>>>> non-WoWLAN mode is chosen for all.
>>>>
>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>>
>>>> Tested-by: Takashi Iwai <tiwai@suse.de>
>>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>>> ---
> [...]
> 
>> Could you share complete kernel dmesg log?
> There's nothing interesting in it, but sure..
> 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b0]
> [    0.000000] Linux version 6.16.0-rc3-next-20250623 (konrad@archlinux) (clang version 20.1.6, LLD 20.1.6) #12182 SMP Mon Jun 23 13:27:07 CEST 2025
> [    0.000000] KASLR enabled
> [    0.000000] Machine model: Qualcomm SC8280XP CRD

[...]

> [    7.669494] mhi mhi0: Direct firmware load for ath11k/WCN6855/hw2.0/amss.bin failed
with error -2

Thanks, this helps understand the issue.

And BTW, WLAN firmware is missing in your setup, you may get them from linux firmware repo
to avoid this issue.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git





