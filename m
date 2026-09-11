Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026F5C88E53
	for <ath11k@archiver.kernel.org>; Fri, 11 Sep 2026 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OtAeaEzDJWSnxc6hOwyQ/p2ysP8I4G/KmKcn6en/a4=; b=Cg8Gt5MVvhKb/jzC5NRr9PhUuA
	x86bBblY1zFXd1EwZTccvIdknsVDY8xzmgx62aRyd4/M+Euy9djYCBDufT6zw4TpbPDuRvRkyxd9h
	x0GE+k0gvV24PwrnsWerIYaPzyTHxBThVZWcUKPvFjUVl9FaGqAICPP0k3eu7RKVziVqbi742rMuk
	FRtTzjonbGmfnfCU0NnrcmwFKFkRi818muuJ5g3FYOjus/5qBcdCYTRD9la4rBKZse7jfqpB94ckF
	sTqlCkxoiiDjIbF4tSrOFhHYkHe33e73awOh7y5r5iCiOll4FMPPeL0heB0eZ1FYJNRN/bdBmlAji
	d49+rvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54W8-0000000HGTD-0Bq1;
	Fri, 11 Sep 2026 16:54:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54W5-0000000HGSl-43oQ
	for ath11k@lists.infradead.org;
	Fri, 11 Sep 2026 16:54:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BG4Awu3427100
	for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 16:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OtAeaEzDJWSnxc6hOwyQ/p2ysP8I4G/KmKcn6en/a4=; b=IKzqf4Zb/6oZPw+T
	m54Ls1JJUPuVADtK0cUTo8Grv8KWIbiJgjo0caehqT1gQKoUeMYHJ+QoFtOQJzHE
	Z8u57otJnS9HUvJB6oKXAYcF5P6DJ18eZwK+b3EVMxYDRe6GnZt2GUbIN8I6r/uW
	MombnOY9eQUATUBu/0l8zdJPzgq+/RgLVxYOboVlUUuXUJGTDbX91KbQjDxrKUTt
	LTXA1fA72cFX3nSCZj/SdqFE04WKItcV9uGDjtToJ90IeOd1pv6rzraXYGBTgxLM
	/KA0cXgJTLZN7NsEdDPS/9Yk16qlxFkhfOEhgE38aJ3WDNgt6qOHk020UygFBDPX
	zpNAtw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubr6tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 16:54:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a63cca6ffso1411412b3a.3
        for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145660; x=1789750460; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OtAeaEzDJWSnxc6hOwyQ/p2ysP8I4G/KmKcn6en/a4=;
        b=bycHGrFX9w0maOdUYcUEMXeNABvoz3hyAR8fOCMdMm8fYeLF93oqzHgTWRqhWTZ47E
         WT67S0vpBJ/gSWMVi7dSVfwkqHZxjzxJt2mvVbi3ilgX5CrGkqOqIHnDhvWznkyIEzDp
         MUU2KqmTVzRkC2s8cjpIA6nq/iIpQRURjf/ugvgI9V3y7TPGmDGIacRdw7YzaLcVgOvi
         XJl/+1QSaEqmxuOmc/6rBGdzt5nrthzg3BLbevH6KDujGLsZy84idwgIsQo/g0elPOG3
         4FLgMb5myrhvaXzuT0D29odIOYLVcJRp2CCjxxa4wckcfuVmq0rdUni6UIbm/iMOWHtb
         49yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145660; x=1789750460;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OtAeaEzDJWSnxc6hOwyQ/p2ysP8I4G/KmKcn6en/a4=;
        b=TB3bunZuA7rZhhwxFueBzxkojs3tBt9e0/+MhGasoWgkSP+g7bBbF1V4EIxayHK0F+
         MqfwD6UUgvBBsabXzKlEMqODx4GOAgsaLMFogLZalUHfsczdvT+Q8RD9DSziL6SaJYiH
         7LoJMCO/SRv5WDvN1g0FF30EcB4TPwVo9zWUxv4hV9LgEZFzbW2qlmMG1mOpI6DCjnGN
         mcHbFcourRQkpEpB8nirlTngwHKVT8tomGrrauIlNwlT2IQl7x055/481wGs4L06OHco
         YSQw1AsqE3DtK03gSzc1/fq09TDRujq8cg0/zL8HCDf2xYNJnXBVKxJwsni/x3CP8fPt
         F6nA==
X-Gm-Message-State: AFuF++kPgZHz3BN8Pqzu5snsoDR0VL6joTxNokOCfg8Snca6E/csnUwd
	0t2NkEzM+MwSki94txREN0fXwEg+z5VKL4Fq1UT1yAn0GNpyp7n+3xVBFlEu3sFjEFbgVEN5hSk
	NMv5MOzgIz3baWs2mUZWRG3uuqc+o58B2PyvT+UtwUY515jRFgi18edIZzIl+SypZFuuLPyWn
X-Gm-Gg: AYBFou0VuoZ8cXbf/hxXKe+bdOeL3RgBTvFJIp+rkLyvlnx2URm1YBRJqx1+pH1AxUL
	noiRi0li7ST9r6Bf5pJZLwbY64rXsINuxJoh8iyEv4ALCPFvm02VX3g7TdilDM9JzWU1IT59Nrx
	Vf3te7w8XQFzqlRc8UpSK+eBR9Z8DcluDnR8+7z0KUXRDZq6LM9S7CMETRt8wE4yZdov9HQ3Nxu
	nUAgWQfoy030+nDzgt+VrFvpbWO0Pdo1zCvZ3OR08+OF9HlkBLrszmJu4Sg+LJJHz1irduN+Dwb
	yRZplZ/nCKGWELY8YTPqXHtnjnLKauGYVihKbaq29YvFn5u6fcbpd+iYXyUrJk8ZVvaaJ7X9sSw
	Rjdy77GBp0Gg1ZMbFDvqTv9eL99ePD/vn050X4A+MrYsW2w9eeIMmCYD8M/sm
X-Received: by 2002:a05:6a00:2311:b0:86a:c062:8af2 with SMTP id d2e1a72fcca58-86b2e8f969fmr6340044b3a.3.1789145659801;
        Fri, 11 Sep 2026 09:54:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2311:b0:86a:c062:8af2 with SMTP id d2e1a72fcca58-86b2e8f969fmr6339998b3a.3.1789145659042;
        Fri, 11 Sep 2026 09:54:19 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a1b827esm1404741b3a.51.2026.09.11.09.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:54:18 -0700 (PDT)
Message-ID: <29439f1f-f859-4c64-b7b8-a0b880cdd654@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:54:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com, jjohnson@kernel.org,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de>
 <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: heIXlLjE7n44rdHqcYuDlj4BetUeTfaM
X-Proofpoint-ORIG-GUID: heIXlLjE7n44rdHqcYuDlj4BetUeTfaM
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa4323c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=m9YswNKu3YyjH8mwH4oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNiBTYWx0ZWRfX/P8+IMMg9IJT
 L3szj9gILk38M7nuLJcO+jjz55xgh6ovNtBRc0Y0jN5Aj0WWhuvfCGmQdQwSdMgMoNc9jG8gfii
 NxlGyqttpeE4RDn/W3Y5K8KSsDbNR9EnzNThO0LzvJE+GeqG+6arYCvi5Xs6E29YUd724kYmFzg
 P4ZMZ1wv0QEFrKvaOTR9r/PS+EmJ3K7Ky6b/zW1fiMnLnxh5yeXGV3QL11RVWJZ87LMjiccSKcU
 oPzTVySfBwyiRLYAFecnlIFeXZ4YwY6TA0wfJL9Une8q4+V3+KbkWeEj9nf5Tqv25gkJozyd0mU
 3QdLQubuJwKCBbuvImXoPibYD3fqefhb418JTGv7RCJmxf5KLTxI9GfnXE9+qe5QRLeqvky9i2B
 xJuI2NJcJSRYaW+4rW/6UggkZxoD4uOTtxqXeujweoi9N8ceU8ivmzO8lkRzfE//vIPw2xpVmLi
 lIFKJRKhDbqGL7qme+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNiBTYWx0ZWRfX+sYqTb7Nr5fI
 TA5TdLT08bKaqBpZMMw+Nl1ll1n2ybsrsK5BQ0j3gBhPBPkADaaFdJc7dSV5x1RqDwe3JXCgIc5
 yNdk4ZXjaM3cxAXvAuvUDINlQEHrOHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_095422_011672_71E73358 
X-CRM114-Status: GOOD (  21.49  )
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

On 9/11/2026 12:53 AM, Marek Szyprowski wrote:
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
> 
> 
> # time rtcwake -s10 -mmem
> rtcwake: assuming RTC uses UTC ...
> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:05:43 1970
> PM: suspend entry (s2idle)
> Filesystems sync: 0.037 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.008 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.004 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> dwc3-qcom-legacy a6f8800.usb: port-1 HS-PHY not in L2
> qcom-pcie 1c08000.pcie: Device not found
> qcom-pcie 1c10000.pcie: Device not found
> qcom-pcie 1c00000.pcie: PCIe Gen.2 x1 link up
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x4 soc_id 0xffffffff
> ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
> ath11k_pci 0000:01:00.0: Service connect timeout
> ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
> ath11k_pci 0000:01:00.0: failed to start core: -110
> ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
> ax88179_178a 2-1.1:1.0 eth0: ax88179 - Link status is: 1
> ath11k_pci 0000:01:00.0: timeout while waiting for restart complete
> ath11k_pci 0000:01:00.0: failed to resume core: -110
> ath11k_pci 0000:01:00.0: PM: dpm_run_callback(): pci_pm_resume returns -110
> ath11k_pci 0000:01:00.0: PM: failed to resume async: error -110
> ath11k_pci 0000:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> ath11k_pci 0000:01:00.0: failed to enable PMF QOS: (-108
> ------------[ cut here ]------------
> Hardware became unavailable upon resume. This could be a software issue prior to suspend or a hardware issue.
> WARNING: net/mac80211/util.c:1957 at ieee80211_reconfig+0x508/0x1ed0 [mac80211], CPU#0: kworker/u32:1/61
> Modules linked in: ...
> CPU: 0 UID: 0 PID: 61 Comm: kworker/u32:1 Not tainted 7.2.0+ #13652 PREEMPT
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: async async_run_entry_fn
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : ieee80211_reconfig+0x508/0x1ed0 [mac80211]
> lr : ieee80211_reconfig+0x508/0x1ed0 [mac80211]
> ..
> Call trace:
>  ieee80211_reconfig+0x508/0x1ed0 [mac80211] (P)
>  ieee80211_resume+0x4c/0x68 [mac80211]
>  wiphy_resume+0xb0/0x28c [cfg80211]
>  dpm_run_callback+0x8c/0x158
>  device_resume+0x128/0x36c
>  async_resume+0x24/0x3c
>  async_run_entry_fn+0x34/0xe0
>  process_one_work+0x24c/0x844
>  worker_thread+0x1bc/0x368
>  kthread+0x134/0x140
>  ret_from_fork+0x10/0x20
> irq event stamp: 701092
> hardirqs last  enabled at (701091): [<ffffac645b5ec938>] vprintk_store+0x3e4/0x49c
> hardirqs last disabled at (701092): [<ffffac645c7dc11c>] el1_brk64+0x20/0x60
> softirqs last  enabled at (701078): [<ffffac640ef2c358>] ath11k_htc_send+0x264/0x2f0 [ath11k]
> softirqs last disabled at (701076): [<ffffac640ef2c344>] ath11k_htc_send+0x250/0x2f0 [ath11k]
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> WARNING: net/mac80211/driver-ops.c:41 at drv_stop+0x24c/0x264 [mac80211], CPU#0: kworker/u32:1/61
> Modules linked in: ...
> CPU: 0 UID: 0 PID: 61 Comm: kworker/u32:1 Tainted: G        W           7.2.0+ #13652 PREEMPT
> Tainted: [W]=WARN
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: async async_run_entry_fn
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drv_stop+0x24c/0x264 [mac80211]
> lr : drv_stop+0x23c/0x264 [mac80211]
> ...
> Call trace:
>  drv_stop+0x24c/0x264 [mac80211] (P)
>  ieee80211_stop_device+0x80/0x90 [mac80211]
>  ieee80211_do_stop+0x614/0x960 [mac80211]
>  ieee80211_stop+0x68/0xd8 [mac80211]
>  __dev_close_many+0xe0/0x224
>  netif_close_many+0x8c/0x1c0
>  netif_close+0x70/0x84
>  dev_close+0x38/0x60
>  cfg80211_shutdown_all_interfaces+0x4c/0x138 [cfg80211]
>  wiphy_resume+0xec/0x28c [cfg80211]
>  dpm_run_callback+0x8c/0x158
>  device_resume+0x128/0x36c
>  async_resume+0x24/0x3c
>  async_run_entry_fn+0x34/0xe0
>  process_one_work+0x24c/0x844
>  worker_thread+0x1bc/0x368
>  kthread+0x134/0x140
>  ret_from_fork+0x10/0x20
> irq event stamp: 701378
> hardirqs last  enabled at (701377): [<ffffac645c7f21e4>] _raw_spin_unlock_irqrestore+0x6c/0x70
> hardirqs last disabled at (701378): [<ffffac645c7dc11c>] el1_brk64+0x20/0x60
> softirqs last  enabled at (701366): [<ffffac640ed4dedc>] ieee80211_stop_device+0x2c/0x90 [mac80211]
> softirqs last disabled at (701360): [<ffffac640ed4dec8>] ieee80211_stop_device+0x18/0x90 [mac80211]
> ---[ end trace 0000000000000000 ]---
> ieee80211 phy0: PM: dpm_run_callback(): wiphy_resume [cfg80211] returns -108
> ieee80211 phy0: PM: failed to resume async: error -108
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
> 
> 
> Before that commit it worked fine:
> 
> # time rtcwake -s10 -mmem
> rtcwake: assuming RTC uses UTC ...
> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:05:42 1970
> PM: suspend entry (s2idle)
> Filesystems sync: 0.042 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.005 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.003 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> dwc3-qcom-legacy a6f8800.usb: port-1 HS-PHY not in L2
> qcom-pcie 1c08000.pcie: Device not found
> qcom-pcie 1c10000.pcie: Device not found
> qcom-pcie 1c00000.pcie: PCIe Gen.2 x1 link up
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x4 soc_id 0xffffffff
> ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit

Baochen, can you look into this?

Thanks!
/jeff

