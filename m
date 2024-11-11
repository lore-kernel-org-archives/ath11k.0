Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6FED12D5C
	for <ath11k@archiver.kernel.org>; Mon, 11 Nov 2024 00:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXXIVsMXYea9lQ1h7IVhigDwnLn4QfTWicGWnzptcvo=; b=p57KowfGY9Fz3EsCsY7Zc6QSjr
	GT8HuwUX0f6Vrs973PyVMzBLLWvKHPD+kSAMCIqDZyVicyc55HfcC+leZsCOLMYiHdlaDsu/w78Ra
	OSM2JN6BlBl1VXlUa8Hg4DpGCN4U3G6SeGU7rir8ORUbluOz16w/Di0gsOuWioQqKLI2u0NOG9ioG
	0uU/Pg3BFDzY4eSQ5BNvFb0xPCU4Gr1D17s99yY2afK4VbauL7GV4h7z7oAN3Yr49yN+CFl5FWwy3
	bmezoGQGYKcNg5j5j+8CnCaU83Uzmm5mT4fB64dedLvUoRXnqR8kYwVJXrN/TgFKwzOGH4or/TlZy
	dZgSYWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIQj-0000000FwT5-2VZY;
	Mon, 11 Nov 2024 00:37:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIQg-0000000FwSZ-1HsO
	for ath11k@lists.infradead.org;
	Mon, 11 Nov 2024 00:37:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AALwWTm015590;
	Mon, 11 Nov 2024 00:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXXIVsMXYea9lQ1h7IVhigDwnLn4QfTWicGWnzptcvo=; b=ME5rrMJjI1ywIf1a
	iLGMPf2rMnoMMCysYRkwy+2eySzWDuidfftKuCTXQk/lfSG3EsYx8rIzmvwV6OF1
	XqMfchTlIYkCNxNZ9V/vwEM0mi4NSFvyZL38VnL7jFZREmlIaDXrp3v+M8k5AKxg
	htl/bVEwPiXmVY1L+avTLTR8Io61QnVWmktFIFulvyvkkcBkPJmcrNM9v8ySTreb
	94QDdtCqSVKV0lVRvGL6mFErFx2jfqD6kvCh9WXdD2beQEMO4i1dllDyFO3fjPIn
	laj/R+Bt/nf5qfC3gy3CkoEEjNtCsvaMNYTENrMJbsfr/O0rAh2vgBEj8wVG7e4W
	0XCvzw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxr5tufp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 00:37:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AB0bBmG018341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 00:37:11 GMT
Received: from [10.253.12.250] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 10 Nov
 2024 16:37:10 -0800
Message-ID: <394e8fa6-7da7-4fad-ab14-e1927f868d38@quicinc.com>
Date: Mon, 11 Nov 2024 08:37:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hot busy loop inside ath11k
To: <ath11k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
References: <7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com>
 <87a5eb5cw5.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87a5eb5cw5.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wovZUQxWJ9d-kZmzjy9MoEiJ2k5nhZ3P
X-Proofpoint-GUID: wovZUQxWJ9d-kZmzjy9MoEiJ2k5nhZ3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411110003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_163718_567156_179AAE52 
X-CRM114-Status: GOOD (  16.01  )
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



On 11/7/2024 10:36 PM, Kalle Valo wrote:
> "Yury Vostrikov" <mon@unformed.ru> writes:
> 
>> Hi Kalle,
>>
>> It seems there is problem with busy wait inside
>> ath11k_debugfs_fw_stats_request. I have a laptop with QCNFA765 WiFi
>> controller. It is running vanilla v6.11.4 with the following fw:
>>
>>> [    3.934078] ath11k_pci 0000:01:00.0: wcn6855 hw2.1
>>> [    4.801624] ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
>>> [    4.802469] ath11k_pci 0000:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>>
>> Sometimes after device wakes up, the system becomes
>> sluggish and burns CPU. A assume it is because of a firmware bug, but driver
>> should not waste CPU regardless.
>>
>> According to perf, the most time is spent in busy waitin inside  ath11k_debugfs_fw_stats_request:
>>
>> 94.60%     0.00%  i3status         [kernel.kallsyms]                 [k] do_syscall_64
>>         |
>>          --94.60%--do_syscall_64
>>                    |
>>                     --94.55%--__sys_sendmsg
>>                               ___sys_sendmsg
>>                               ____sys_sendmsg
>>                               netlink_sendmsg
>>                               netlink_unicast
>>                               genl_rcv
>>                               netlink_rcv_skb
>>                               genl_rcv_msg
>>                               |
>>                                --94.55%--genl_family_rcv_msg_dumpit
>>                                          __netlink_dump_start
>>                                          netlink_dump
>>                                          genl_dumpit
>>                                          nl80211_dump_station
>>                                          |
>>                                           --94.55%--ieee80211_dump_station
>>                                                     sta_set_sinfo
>>                                                     |
>>                                                      --94.55%--ath11k_mac_op_sta_statistics
>>                                                                ath11k_debugfs_get_fw_stats
>>                                                                |
>>                                                                 --94.55%--ath11k_debugfs_fw_stats_request
>>                                                                           |
>>                                                                           |--41.73%--_raw_spin_lock_bh
>>                                                                           |
>>                                                                           |--22.74%--__local_bh_enable_ip
>>                                                                           |
>>                                                                           |--9.22%--_raw_spin_unlock_bh
>>                                                                           |
>>                                                                            --6.66%--srso_alias_safe_ret
>>
>> If I'm reading the code correctly, then ath11k_debugfs_fw_stats_request has 3 second timeout:
>>
>>> timeout = jiffies + msecs_to_jiffies(3 * 1000);
>>
>> however, it only waits for 1 second:
>>
>>> time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
>>
>> the rest (2 seconds) is spent inside busy loop
>>
>>> 	for (;;) {
>>> 		if (time_after(jiffies, timeout))
>>> 			break;
>>>
>>> 		spin_lock_bh(&ar->data_lock);
>>> 		if (ar->fw_stats_done) {
>>> 			spin_unlock_bh(&ar->data_lock);
>>> 			break;
>>> 		}
>>> 		spin_unlock_bh(&ar->data_lock);
>>> 	}
>>
>>
>> spinning  for 2 seconds seems excessive to me. What do you think?
> 
> Oh wow, excessive is an understatement :) That's horrible, I don't know
> how we missed that. And an unlimited loop like that is a big no-no in
> kernel, every loop should have a some kind of maximum limit. Can someone
> send a patch?
Hi Kalle, I already sent an internal patch to fix this.

> 
>> Also, if you happen to know how & where to report firmware bugs, I'd
>> appreciate any pointers.
> 
> I recommend filing to bugzilla:
> 
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html
> 
> Though we are overwhelmed with everything right now so don't expect a
> quick response :/
> 


