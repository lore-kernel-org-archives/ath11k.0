Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B003AC88E50
	for <ath11k@archiver.kernel.org>; Mon, 14 Sep 2026 06:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yxpww4PsWrQfLBdJ0//BJx7bMEXgGPZ3hXMqdr6a/8Q=; b=vsfEQkUdFoUkHZiMAgGgPiXKTF
	/PYEuKQIsPqXs5sailSVxyHL4YMCkbGVJeiqQvRciaU/VoO7ZFs0jle9JDinc8D1QO6q/IDUDsLY4
	nx6A3NMV7stxiXRJLfbUZSimA8DtA3HqbBZqXv4NKSX6oVDnWX8zZubsNqmOgGqcrnrO4NHYej/D7
	xABHEGX9nqGgNe/zMKFktBvXXTg5N/KksdMgXEqhGlPDDyVv+fZWJdE5J1jug+nqsJl673OXIsLVp
	Lqt0Jq1wpkjEkykdc3iG2FzVKP4R7pqHvpVR4pQZJcBiDWUNihE/JCUfQhcoYUV6gcAs4HFOwzxzo
	7BxuVuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60FC-00000002RWg-0Gzq;
	Mon, 14 Sep 2026 06:32:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60F9-00000002RW8-0jNE
	for ath11k@lists.infradead.org;
	Mon, 14 Sep 2026 06:32:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifnf3127277
	for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 06:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yxpww4PsWrQfLBdJ0//BJx7bMEXgGPZ3hXMqdr6a/8Q=; b=H6IzJbIyyEs2fDiW
	czjRwtavp+EgRixByOuyThU185VwMjb9guaErkjcMXQvPxn8MB/wrboXUuK9+UnG
	FhvKyaEcP300I9o/JMzR0GTjEUIvHCs1Ph2pdrM4zXVjjFZLqnPBxoj4Cgk0iyas
	K6sKbahwGAm10tJLHnHrgR4r1I3o1z0Ge5D9afzZ/U97f0x8oQvm4gDzgOJ/ltt2
	gifOJpQ50wjsCC1KyBdbawizsrGETzDgEejWvTQFzp+djvRUDoKAoZmVvsBadMlA
	oKjSJYKQWZ7QWrwBRPpW/2WNHZDtheGpbqbi6XQxX3szETXcLDyiizNWCn+oY+a9
	OpwIjQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018n6g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 06:32:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1288118a91.1
        for <ath11k@lists.infradead.org>; Sun, 13 Sep 2026 23:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789367562; x=1789972362; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yxpww4PsWrQfLBdJ0//BJx7bMEXgGPZ3hXMqdr6a/8Q=;
        b=TVVzJTZp0WsAm0BCO936G8OoTXBhvvchHUys/tEdkbVUeT2tQCWvbui6uAGJtdagww
         IG+EoB0Lmj0AeuQsqCCghnJzalI4yvKsbxb+uLc2ETSIweI4ul3uiUrc/S/oOVqMM3Fr
         L2JQtS63gep0fTTzuJ9f3WQNarxgFubYMbdyEoc7Jrtv7r7STyMQaXVh+XXr+narsDKn
         VpJ94hSovpfqQVBNs1QWYGfy7ZHuRhY6Iwg9EguqF+M5nXjFfgj9oqnzNAsvIlHNHeWT
         kOuchdEuIkPgn4vb5tVdTKW5CwR4hscOF9IFB8iGo0YsoSQkHwvQnGW1XGpTwk1BpNjj
         5TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367562; x=1789972362;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yxpww4PsWrQfLBdJ0//BJx7bMEXgGPZ3hXMqdr6a/8Q=;
        b=DJMoCz73R0ARAWTD7SeUaWmPtUaKfgxSQuKiNG1IqcDTQO+a2x80vSvq00bOne+GVz
         s4w2z5PrpWFhXRq6QD5peJq50sQiHY6PLo1cDsdlb79OhXlPuxfBDoH8cun1ExNl0pIE
         0f9d3WWNVEqeH1+bgRu0p6GBJzfZsHjBuOSywuAPs4dclmMGDmaKQxva9MWqiIuqX1AO
         wEzkYm3VNN1IghqdRn5ZZ08F5VrzyM7cAvgrtJFjznl9Na/E5eIAe3lR3zfNmEIHjFWM
         f8W2EtuTdAyZ2qSV8eTK/xKFxE3hAJcgZuLM3g4WK/dU3/fZPgsqZ6iOIX7Al2/8IHMM
         0O/A==
X-Gm-Message-State: AFuF++lMroUo8Jz+VNnn+Ysmc1QU1FgDZaKxza9phIS7ayvyEZyhVnW0
	c9dqu+UQPkDh3o6y0LsIqsPhH03aQ85DIF6pzPUAkAamhVupiMB7I92K7pRFGrZR2/oUyiL0utu
	VxlDX3Z6YBTIhUjU90fqA/bSoPwD6oe8Bn4YmB520WWANRgCbplS/lLHWxcxLgYqZ
X-Gm-Gg: AYBFou0KDq/cJCwmPhXwWxPHeVQnL6T36jUK/QVX6g/a6HNgJDK36Cf/YawRixU7Ygo
	zwuAHV2aZ7g0zUl99MgvZfbSViWUasxAhbNyj2dEz+eVxoiwlMX3kGb9LhoNcDyoIwl/MXjVYTF
	oO1M6NStsdNsss8WBa9FQxhkzLkZeYpF7Lxp1sZdwBZwq+zYbwAlU6EBk8oEFbfdqaaGQU+FUTp
	5LVZxGHpf/tmKHJ7ErYi1xJWKa8ZXMkGlFz4jwpBX0LQCb82bjm4IhqY7HaWre1Or45AxDt/epA
	C/ExOcujlrErAWFq60KGRXjpH6WINvGIeY70wpZ3wQw8Hhfy8BgIM2YaKBJDcDLuT7o9CFYFaDz
	SiaGTdNI0zyzncthEoqS6TqO6kwaPXQM4Od8IuGISf1Gw5/GQ5PX2Ic4YFRyzksenZ2Sd1yM5
X-Received: by 2002:a17:90b:35d1:b0:39d:f189:48d6 with SMTP id 98e67ed59e1d1-39df1894982mr783853a91.4.1789367561870;
        Sun, 13 Sep 2026 23:32:41 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:39d:f189:48d6 with SMTP id 98e67ed59e1d1-39df1894982mr783801a91.4.1789367561416;
        Sun, 13 Sep 2026 23:32:41 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dada5c76asm17463531a91.12.2026.09.13.23.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:32:41 -0700 (PDT)
Message-ID: <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:32:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de>
 <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa7950a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KAfsIobKxm3l_v_usUoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5MCBTYWx0ZWRfX+slnxIPXyfi0
 u/V1+om5XwP58GGRPPAFaZ4Tjm05l7Vjucmm5YgRrv871wsqvi2Y1RYEAF5tFhq4pvJARKBWdNC
 e/qDVQuVKdhq+jos+tMtA6iUSpPHrWk=
X-Proofpoint-GUID: UqSINOJnfhmSP4B6xAxtx-vb68_7VzbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5MCBTYWx0ZWRfX0aOCSJTK/ZxR
 /c8IoAXfO6pCvKyhE/YuzXkM0fnI5fIEbEeEKi3Vfw/o7YtGdiaNNnoodMIGpkQdGCn+jwlwgQf
 K64Z8zgQFJOOz5Y4jYaQgmNk664yzKyVhQ1VNRhrNifSzuGCJilqXDtDoM2ofWZ9fN2QA8QofKs
 n963GxIomZh6yki9bpIDqhbww4mwoAxWFVvdO9yoXWnAME8G/decBWNMXq8nmJKLdzoWJ9eGr4g
 BZ8vRZy0ys8XskTKHNBmWoqliTuGdkYA492ON66T8Pw69MpidMjFBZ4/0KzG/zE6d40XAZWw9Cr
 F0bBSQpfWrNYY7piy1gejeHLGxG3MAthvEDlC1KIYj07HnXtsGbHmSw+13pkYE+8LfwUaKqPAeP
 qJA+mDjQoCLY9q6Q9JSKvi0+tlXeNzCVvpwQyPqK+dSA013/3ysjmU1LAu6hv8hjwSzcL2iXv3F
 t9S/F0M9LYR1m5n5e1w==
X-Proofpoint-ORIG-GUID: UqSINOJnfhmSP4B6xAxtx-vb68_7VzbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_233243_222604_4F872368 
X-CRM114-Status: GOOD (  19.69  )
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



On 9/11/2026 3:53 PM, Marek Szyprowski wrote:
> On 27.07.2026 00:19, Julius Bairaktaris wrote:
>> On IPQ8074 a firmware assert reboots the SoC:
>>
>>   Unable to handle kernel read from unreadable memory at virtual address 0
>>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
>>   lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
>>   Call trace:
>>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
>>    ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
>>    ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
>>    ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
>>    __napi_poll+0x38/0x188
>>    net_rx_action+0x120/0x2c0
>>
>> ath11k_core_reconfigure_on_crash() tears the data path down with
>> ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
>> which memsets the ring list. The DP NAPI is still running while that
>> happens, so it services a ring whose address pointer has just been
>> cleared.
>>
>> That function used to disable the interrupts first, until
>> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
>> moved the disable into ath11k_core_reset(). reset_work is only queued
>> from mhi.c and from the debugfs hw-restart handler, so AHB parts never
>> run it on a real firmware crash. Their recovery goes QMI server exit ->
>> restart_work -> ath11k_core_reconfigure_on_crash() ->
>> ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
>> anywhere along it.
>>
>> Disable them again on the crash path. The reset path has already done
>> so by the time it gets here, hence the ab->is_reset check.
>>
>> This is also why the debugfs hw-restart trigger never showed the
>> problem: it goes through ath11k_core_reset(), the one path that still
>> had the disable.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> 
> 
> This patch landed recently in linux-next as commit f7a74e131d3f ("wifi: ath11k:
> disable interrupts during firmware crash recovery"). In my tests I found that it
> causes a regression on QCOM RB5 board during system suspend/resume cycle
> (s2idle):

Hi @Marek, can you please try if below diff can fix this regression? Also, @Julis, can you
please also confirm if it can address your original issue as well?

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d2ed6a0ea7e3..1ad0a47653de 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1275,9 +1275,6 @@ int ath11k_core_suspend_late(struct ath11k_base *ab)
 	if (ab->actual_pm_policy == ATH11K_PM_WOW)
 		return 0;

-	ath11k_hif_irq_disable(ab);
-	ath11k_hif_ce_irq_disable(ab);
-
 	ath11k_hif_power_down(ab, true);

 	return 0;
@@ -2333,17 +2330,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	int ret;

 	mutex_lock(&ab->core_lock);
+	ath11k_hif_irq_disable(ab);
+	ath11k_hif_ce_irq_disable(ab);
 	ath11k_thermal_unregister(ab);
-
-	/*
-	 * ath11k_core_reset() already disabled the interrupts on the reset
-	 * path; only the firmware crash path reaches here with them live.
-	 */
-	if (!ab->is_reset) {
-		ath11k_hif_irq_disable(ab);
-		ath11k_hif_ce_irq_disable(ab);
-	}
-
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
@@ -2605,9 +2594,6 @@ static void ath11k_core_reset(struct work_struct *work)
 	time_left = wait_for_completion_timeout(&ab->recovery_start,
 						ATH11K_RECOVER_START_TIMEOUT_HZ);

-	ath11k_hif_irq_disable(ab);
-	ath11k_hif_ce_irq_disable(ab);
-
 	ath11k_hif_power_down(ab, false);
 	ath11k_hif_power_up(ab);

-- 
2.34.1


