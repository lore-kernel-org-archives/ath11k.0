Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76078C61CE8
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaomhS8dMfrepLdECiBKjEBqxHnNVF77uNFcGepwSTk=; b=hLcIh06paNXyzm/tj34AYyWCRX
	9vGT1Aml/k988Wj/qsb3uun05Ll2p1HA9Pfp58CKlPDmZpfR5a1OrFY2nvVrbWSAw1pc2HRXYCMl3
	Hje77hMuj1juEa1guX2snPh/62oiK/lzURbjIMoGcSBhQlgahvzRLTkmS87iAWJopUi6kcY3EdVRd
	oDu1gFo8l4Pa86N+4KyWuCxOEo+qwERn5I8OWjgQgNWUcvjBXZRTmdGyTRLTV6SDg5PwrdjV5RXOl
	LVr8dUJN1VqtRtqYLH6EKRKf/60GTjvKZu1G/g1ZXt9pjMgtKksQeSCmi6Fwv74/NoU8zE8PJyj1N
	h5LyYRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdXv-0000000CgTU-0VkM;
	Thu, 12 Jun 2025 08:44:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcst-0000000CXkz-17JB
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 08:02:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7lGAr027235;
	Thu, 12 Jun 2025 08:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oaomhS8dMfrepLdECiBKjEBqxHnNVF77uNFcGepwSTk=; b=OjmAtI2kg69l6oBp
	3F+aK87BasOzZV7pvTbNzU39NSpu0Go3Qz7sz3UNnCxHl413tBKyCt0qEYDAcIRi
	gPAtwBFI167IrJmJBfVwM4vDJrNqGr9CzaP+c1/FuHqFHuaIzj++yMnFwFHswZyX
	Th3cJ8HFkoXE2Sz6NMJWp548CVyn1OH02U7lTiKzbq6JAx5KViha8Ciiws2vfKn3
	dfQJBH70WtUq6NsDFQh/l0z7QBeiKl5O2C2RQBa4jt57gEIi/Os3XZtnKvgiyCHz
	IkXZJVR7+F1YtoKW6ZdQuJgzth994Dh8iYOtLETIGY/0iFZVjMMyQKF7tJGoJmPM
	SD6cGA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrheprd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 08:01:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C81sC6020488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 08:01:54 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Jun
 2025 01:01:52 -0700
Message-ID: <d02bca79-66f1-48b0-8c3b-aeaaa17135a9@quicinc.com>
Date: Thu, 12 Jun 2025 16:01:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
To: Sergey Senozhatsky <senozhatsky@chromium.org>, <akpm@linux-foundation.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
 <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684a8973 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=gw6Avj90hZdGHWO8bBkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SurSnutfkbfhL8eagUqC8sWXXVKQyfUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2MSBTYWx0ZWRfXyGVF4C944/yV
 CWktncgLfW/3bkZlpSr2rXRBA6go89MAZu0sDepB9EQV0y2Ocx7cyYA5hPfT8qJHjUL2hm7gNG9
 NiwL15W6Ytw+Z1g+8qfpSW+eiCDFYy65RnLUdAXpN47F/4vVsfS2nhBPLpGHWSMtscZ0fOsBaWm
 badj40hNHNAmA5I1tbXWyEi03JjV/r1LcG8RHxW8372g9BmpMpN1JJhLpWrsOIRZjodKzAa+127
 fPdJCVvmQM18ARc3vHuniCthB94e9KAF7JYF+HrQrEOq30CuU3tIqhujY1wfm+mxZxe7xhhW++y
 bt0nGmynG+8sY4qol8MT/ideq5O3G/dn98JWo8Ki/N6mS4aRRg0883ZqajTAabM+cc/mlhyt0m7
 XP79fyYmBQkXLjx3KMrdkMsHR67pVoAyRKoHwnSs0BQ0+NHuy7t+3ngsIgn1rO+qWEONQKXh
X-Proofpoint-GUID: SurSnutfkbfhL8eagUqC8sWXXVKQyfUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_010203_421202_44E85DC9 
X-CRM114-Status: GOOD (  18.28  )
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

[+ kernel mm list]

On 6/12/2025 1:04 PM, Sergey Senozhatsky wrote:
> On (25/06/12 11:30), Baochen Qiang wrote:
>> On 5/29/2025 11:56 AM, Sergey Senozhatsky wrote:
>>> ath11k_hal_srng_deinit() frees rdp and wrp which are used
>>> by srng lists.  Mark srng lists as not-initialized.  This
>>> makes sense, for instance, when device fails to resume
>>> and the driver calls ath11k_hal_srng_deinit() from
>>> ath11k_core_reconfigure_on_crash().
>>
>> Did you see any issue without your change?
> 
> We do see some issues, yes, on LTS kernels.
> 
> [..]
>>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
>>> index 8cb1505a5a0c..cab11a35f911 100644
>>> --- a/drivers/net/wireless/ath/ath11k/hal.c
>>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
>>> @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
>>>  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>>>  {
>>>  	struct ath11k_hal *hal = &ab->hal;
>>> +	int i;
>>> +
>>> +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
>>> +		ab->hal.srng_list[i].initialized = 0;
>>
>> With this flag reset, srng stats would not be dumped in ath11k_hal_dump_srng_stats().
> 
> I think un-initialized lists should not be dumped.
> 
> ath11k_hal_srng_deinit() releases wrp.vaddr and rdp.vaddr, which are
> accessed, as far as I understand it, in ath11k_hal_dump_srng_stats()
> as *srng->u.src_ring.tp_addr and *srng->u.dst_ring.hp_addr, presumably,
> causing things like:
> 
> <1>[173154.396775] BUG: unable to handle page fault for address: ffffb4e4c046f010
> <1>[173154.396778] #PF: supervisor read access in kernel mode
> <1>[173154.396781] #PF: error_code(0x0000) - not-present page

I am confused here: if the root cause is driver trying to read a freed memory, it should
not result in a PF issue. Because even if freed, the page is there and still mapped in
kernel page table.

Andrew, any insights?

> <4>[173154.396824] RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
> <4>[173154.396839] Code: 88 c0 44 89 f2 89 c1 e8 3a 14 06 00 41 be e8 25 00 00 eb 6e 42 0f b6 84 33 78 ff ff ff 89 45 d0 46 8b 7c 33 d8 4a 8b 44 33 e0 <44> 8b 20 46 8b 6c 33 e8 42 8b 04 33 48 89 45 c8 48 8b 3d 45 a3 a0
> <4>[173154.396842] RSP: 0018:ffffb4e4dceefc50 EFLAGS: 00010246
> <4>[173154.396846] RAX: ffffb4e4c046f010 RBX: ffff90d1c3040000 RCX: a0009634a5d28c00
> <4>[173154.396849] RDX: ffffffffb0279d80 RSI: ffffffffb0279d80 RDI: ffff90d2e5d17488
> <4>[173154.396851] RBP: ffffb4e4dceefc90 R08: ffffffffb0249d80 R09: 0000000000003b82
> <4>[173154.396854] R10: 0000000000000004 R11: 00000000ffffffea R12: ffff90d1c3041c90
> <4>[173154.396856] R13: ffff90d1c3040000 R14: 0000000000002828 R15: 0000000000000000
> <4>[173154.396859] FS: 0000000000000000(0000) GS:ffff90d2e5d00000(0000) knlGS:0000000000000000
> <4>[173154.396862] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[173154.396865] CR2: ffffb4e4c046f010 CR3: 000000005ca24000 CR4: 0000000000750ee0
> <4>[173154.396868] PKRU: 55555554
> <4>[173154.396870] Call Trace:
> <4>[173154.396874] <TASK>
> <4>[173154.396883] ? __die_body+0xae/0xb0
> <4>[173154.396890] ? page_fault_oops+0x381/0x3e0
> <4>[173154.396896] ? exc_page_fault+0x69/0xa0
> <4>[173154.396901] ? asm_exc_page_fault+0x22/0x30
> <4>[173154.396908] ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:3de7 4)]
> <4>[173154.396923] ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:3de7 4)]
> <4>[173154.396942] worker_thread+0x390/0x960
> <4>[173154.396949] kthread+0x149/0x170


