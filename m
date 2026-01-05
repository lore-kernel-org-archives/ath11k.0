Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2821FA3724
	for <ath11k@archiver.kernel.org>; Mon,  5 Jan 2026 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiPDhogBVlRkDz0ROS0zoSPWgbmWHu/ItTdRGriWUNw=; b=RKVfIT7pW8gUOdDqUgdUtCKi/F
	3VtJT8OZHawTQSkbWH2D9lRfqc9kEIwSUbMwzL5giyaBJ/ujY0mj7yRxI3oRUwbeimQE8cg/CtjeJ
	fBlDSI2m3rOVN7HMnMP+8KrhpzWO2dPgR2MQ5PFfBr4y41D4ZImgivgwJKf/uJZhJRLusZoUl34lK
	UhFGHXIzoBdlaIZaGbFqOMamRT6H38GgfN8TNNmwhtMabKcD+pl7xF0bLcXMcF07sqpe0m82kZ6I7
	91YTEzvyZgq51QvF4DL+CVF7E6w4E6NqbqkWOICYQZ4/e/6UQzMJ9Kcf/f8BFm7E07IJkiPH+9LhC
	tZnslc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcj84-0000000BEN8-3ooP;
	Mon, 05 Jan 2026 11:52:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcj82-0000000BEMo-0kni
	for ath11k@lists.infradead.org;
	Mon, 05 Jan 2026 11:52:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605851ea978645
	for <ath11k@lists.infradead.org>; Mon, 5 Jan 2026 11:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MiPDhogBVlRkDz0ROS0zoSPWgbmWHu/ItTdRGriWUNw=; b=XLKwD+y5uP8gt9ki
	1b577exVz7B4Bpn22wSW4ONj8bBwzL12pGtfsi66Ojm1hX8ixVqrL2vpzMNOG96G
	PBt+04W+op2ls0q15jaynBNE3rW+RnrqFsmD/zfOEEUx45EgNpqgS7HeDxjX8NvJ
	NXrjgpFtDRSJBfyaki9lCMRZqRpcOVXk18s8q1DT9/Ijswzj6bZ/Cv+DFxFYtMv+
	uPlBruRdhPM7UKSeo4/oM2XZbfGoe7a8dIVsWQmR2wSMxE9bQQdyCuVD5+7uY5yf
	bG42uqlou4Qvp6ncDa0ij8fCFp3I0rS6z1lUUG9NbYW5roXzyWRyA54m9kvMrsrV
	wfTP5Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9ftgngn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 05 Jan 2026 11:52:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471737e673so17949305a12.1
        for <ath11k@lists.infradead.org>; Mon, 05 Jan 2026 03:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767613923; x=1768218723; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MiPDhogBVlRkDz0ROS0zoSPWgbmWHu/ItTdRGriWUNw=;
        b=WoCA3m+XVn+2ZSMvCQz2AlCgMW7Tcdf747AaXhKnqaBv9Xo+PgNktE/ZmozyAxkmyA
         y4BGzSwf+zrvTGdyQlDUQo2WhpdU8W4lfSpHa2dkygF0MXoJooWbi2VbI+mov8euEa/l
         ULNV/ies1TG+kzUjbKvwZQcf1yTsO2vN1pAiS8X8SmdbzLayjiSFkeJqbysdxJ+fZrAn
         dZyYfTm+oMlRuCMQw1x+3fLoX/sZ0GYxcTrxg9HQJ8JIv6fOTbKUJ9bABx+rP+dt2TEc
         UeyTzltBG7sFvHdNzpnrqNY3djiOrdmEI45YQBPns/QdvzeLzLi8+c/MB2aGYFqTcwtB
         XEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767613923; x=1768218723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiPDhogBVlRkDz0ROS0zoSPWgbmWHu/ItTdRGriWUNw=;
        b=eaqmEHd9aQjUe32IX4ALMTNxZTs7DSzqS6NqVkjS3d+PMmF73fWJj2OzY8yrZKBQpD
         081kb/Y+wTfv0ZHKO44+L/FqpPXXoMpjNcVUH5b3MLeUQ+5KvUnBk0GnwAXxJ59+98Br
         0OHPzUvE9e5jPrWYsbM3IdDdTb5irBG3rO1TRJDcC2pH8OUUB6ND/0t/NicVrpZnNdKV
         EOI+Q6LII0IIup0ORgPBjlafLvs35Li9NK/I+QKMdxfQOKSDO0phPWb9f3aRFq9O0sCp
         x9iQJtR0inNI6CK0b4n737M9RNxlA3VYNNv9A9MYAArb384vifF018ExMwyDcUo/Cee+
         JfFw==
X-Forwarded-Encrypted: i=1; AJvYcCXvD/awWtp9tXyftu4XcT/crwqMS2ijYCpbyTdjCpMxFWSTMXXxVbu8AyGxW8y600DNr+wnQOk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5kv6fgQ0BjuRRHnIDfrmGIIKyIkcEu+7IWekWIjspM26t+fCY
	ojWQSO1ytxI4E7Eh3XvPcoSuczR01k7cLukxH1Bl2Tn7BMLRKyw8CaOuA75i47TPozmlB2iAnE0
	15++Ykdu+TaR+A37KATb5u8CjGqf2TD8oGJDw8qTUee74lSot0E2k50WTsIJ66XJM
X-Gm-Gg: AY/fxX6X+2V/pzIE8GSu8WuLNKFJ5JPy9qYiwHEJM/X6mjOSGJxs3sGOmqkkI0WujVs
	ZZxJH6g/qandOwpQ1UzQTtZc+eOuQqY/bZf8KbV40U8Z0v1CLzqHFgMRkD+FzL1rBd5kXrrZCbW
	ccBZxwjLpJiugPjxhnDJTd/ddVqeQBirq7Ze5nVIqAMHvOlbkV4WR2g3l3VNlu1gQQ/9y5WSowM
	IR6JHekLlQdW5RIxmJn0c4qQSCzabXf6l+ptA2gl8pvoUVpApBrwPz0ZaruL2IbbnJXuuffsvA0
	6+NPn/+jWAweq5J+OwZlozhA/Wa3zz7jgC/lQreAgTv9urFs1iHzjwk/tsLlXyL8csKITk1IztG
	TelAPDe1sHwxvp3ncZhDNXOuOMM1OCyo8ZIp1KkFlS9/k0Vi10/2zJHqbU+kjtBU=
X-Received: by 2002:a05:701b:2712:b0:11b:9386:8269 with SMTP id a92af1059eb24-1217230598emr30611810c88.46.1767613923090;
        Mon, 05 Jan 2026 03:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENVIeFd2yx1YhLwh0zFHgcGjWMsyu7GE4t5uCowL63t8BT+FBIcejwvTUdvOJqjnwzUf7K9A==
X-Received: by 2002:a05:701b:2712:b0:11b:9386:8269 with SMTP id a92af1059eb24-1217230598emr30611800c88.46.1767613922473;
        Mon, 05 Jan 2026 03:52:02 -0800 (PST)
Received: from [10.110.83.82] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm191732572c88.12.2026.01.05.03.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 03:52:02 -0800 (PST)
Message-ID: <a7a73ad1-0761-4abc-acc9-fc94a4e77348@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 19:51:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Yu Zhang <yu.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
 <717658b7-91da-4073-a746-a389319aac2d@oss.qualcomm.com>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <717658b7-91da-4073-a746-a389319aac2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6NBcmTfC_717yD8rr1uBmmxnfMBj9ySz
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695ba5e4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=t9aEVhzNtOWW9-RjAKIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6NBcmTfC_717yD8rr1uBmmxnfMBj9ySz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwNCBTYWx0ZWRfX4unJVSMelv8R
 OiPeyUm+S844sDNq5orshXyAXz4iAP6+e19nygRtM96WmfF7K2j495maruqjtGm4EjTBnH9V4ZH
 Q63U84B3LZhWgHPKgg1HcrU4BhFnc5ypwH/Z3upjGjRbDzZ2yVgDo/6v4A5iZkkQL7B1yXa0XBz
 kjBuEQBqg4ufas06MpF2vK5Dg3fa7TTMAfcmyXUu59LF2gCCLkMKppj+i8fH0wu0zqgKJ8hU576
 mSG0XKRg/9LZcrlP7zqinKQgaDuy6ayI1NaFKI+Kb5idf62ILV7X6OT7eJ/P45fDrRy+AggXaVS
 P/5vriCaWTYLFIZloKpMIV9GtClsC4OOI4EJwmSXM8GItvn8L+xGqjLd6XRmBxtTWJ1HAyohcco
 8jQCsCs/ECb8+k2rPAgl6m8xI7kDiDpl87yUN1XA8tW3XgKmTABwuvQkgaFQJgGQUPqMnSLcUKq
 lxfOte61iEph0xPm1JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_035206_364005_3EB50DA6 
X-CRM114-Status: GOOD (  16.73  )
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



On 1/5/2026 10:22 AM, Baochen Qiang wrote:
> 
> 
> On 12/30/2025 4:25 PM, Qian Zhang wrote:
>> To enable/disable cfr feature use command,
>>
>> echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr
>>
>> where, val: 0 to disable CFR and 1 to enable CFR.
>>
>> To enable CFR capture for associated peers,
>>
>> echo "<val> <bw> <periodicity> <method>"
>>   >
>> /sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture
>>
>> val: 0 - stop CFR capture
>>       1 - start CFR capture
>> bw: CFR capture bandwidth
>>       0 - 20MHZ
>>       1 - 40MHZ
>>       2 - 80MHZ
>> Periodicity: Periodicity at which hardware is expceted to collect CFR
>> dump.
>>       0 - single shot capture.
>>       non zero - for Periodic captures (value should be multiple of 10
>> ms)
>> method: Method used by hardware to collect the CFR dump.
>>       0 - from the ACKs of QOS NULL packets.
>>
>> To enable CFR capture for unassociated clients,
>>
>> echo "<mac address> <val> <periodicity>"
>>   > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc
>>
>> Mac address: mac address of the client.
>> Val: 0 - start CFR capture
>>       1 - stop CFR capture
>> Periodicity: Periodicity at which hardware is expceted to collect CFR
>> dump.
>>       0 - single shot capture.
>>       non zero - for Periodic captures (value should be multiple of 10
>> ms)
>>
>> To collect the cfr dump,
>> cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin
>>
>> Previous link:
>> https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/
>>
>> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
>> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
>>
>> ---
>> Changes in v5:
>>   - Restore the author in all patch commit messages.
>>   - Update patch 6/6. Cache the phymode during association and
>>     use it to replace phymode reported by the firmware.
>> Changes in v4:
>>   - Update patch 2/6. Remove redundant bw parameter check in
>>     ath11k_dbg_sta_write_cfr_capture()
>> Changes in v3:
>>   - Update related comments.
>> Changes in v2:
>>   - Update related comments.
>> ---
>>
>> Venkateswara Naralasetty (6):
>>    wifi: ath11k: Add initialization and deinitialization sequence for CFR
>>      module
>>    wifi: ath11k: Register debugfs for CFR configuration
>>    wifi: ath11k: Add support unassociated client CFR
>>    wifi: ath11k: Register relayfs entries for CFR dump
>>    wifi: ath11k: Register DBR event handler for CFR data
>>    wifi: ath11k: Register handler for CFR capture event
>>
>>   drivers/net/wireless/ath/ath11k/Kconfig       |   11 +
>>   drivers/net/wireless/ath/ath11k/Makefile      |    1 +
>>   drivers/net/wireless/ath/ath11k/cfr.c         | 1022 +++++++++++++++++
>>   drivers/net/wireless/ath/ath11k/cfr.h         |  308 +++++
>>   drivers/net/wireless/ath/ath11k/core.c        |   41 +-
>>   drivers/net/wireless/ath/ath11k/core.h        |   19 +-
>>   drivers/net/wireless/ath/ath11k/dbring.c      |   50 +-
>>   drivers/net/wireless/ath/ath11k/dbring.h      |    8 +-
>>   drivers/net/wireless/ath/ath11k/debug.h       |    8 +-
>>   drivers/net/wireless/ath/ath11k/debugfs_sta.c |  142 ++-
>>   drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
>>   drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
>>   drivers/net/wireless/ath/ath11k/mac.c         |   19 +-
>>   drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
>>   drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
>>   15 files changed, 1855 insertions(+), 26 deletions(-)
>>   create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
>>   create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
>>
>>
>> base-commit: 4465d808fda12fa47f83733a9f7b7dbc29d0ea54
>> prerequisite-patch-id: f44bdcbd36af0c3fd57b477848bf4699cade9389
>> prerequisite-patch-id: 76c61f8f00aac2a3b9ff31e0166bb12997c2b0cf
>> prerequisite-patch-id: 886b24b2496167c304e8ed42b5d879e0ecab111c
>> prerequisite-patch-id: 672baf608620c531b3765941c2719ad9d34b99c1
>> prerequisite-patch-id: 07c9ff6fcaf4ba464be993caa19eb49113eedbdf
> 
> what are these dependencies? They are not present in old revisions.
> 
> BTW, if you indeed has dependencies, in addition to these prerequisite-patch-id's, please
> also list them explicitly in the cover letter above.
> 

These dependency details were added by mistake, and I will remove them.

