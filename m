Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D77CD4F39
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOOJkS0Nd5Z+bZiqJQePyXnIYm4EiF7YiYsc7T/csgA=; b=wgvbsXp7Ff7BrfzbFbalry1j/J
	1/kmvEyWWm1at2JCe2drSXkm2BP2lcdNV13H3s3nosECCVOLwojufgPOiwcWuYDafGVPL2XEeTlcT
	z+IFB+A+2bfVFoBhQWZ5r0LQ85n+mRaH+XCHSy3lhpgTzgK5O+kaEnWYT63RhAgRck7wkCwdkbxXw
	O1ypKAQ9fkfRKmj6UQHUGnA0nOms2ONHDRCKXNqKJQlRXU3kSWjQ6XGjpJU5R2ee1CUKEXEylBQGz
	9tBaqaJLWm1XjYbkE6H/jlRmBEFfeB39AxbZmnPWCEBgp+awkmHGst25Sr9JcmSPmUGZYBjZkdHYm
	UsO6XUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPzN-00000004lZX-3jeb;
	Thu, 14 May 2026 06:56:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPzK-00000004lYv-3swB
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 06:56:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0t3C91622280
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 06:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOOJkS0Nd5Z+bZiqJQePyXnIYm4EiF7YiYsc7T/csgA=; b=frOwhw54gnxyf/7i
	Y30LFkbBnOhTlOx3d4m8ILfwnJuOLS5G8mp/kkb2lyTcamJEjUVjiLkX3MKeHD99
	eRa4BObIwcYOdCWjPdaYHVYehsCBEUAjYECjlNH0gXkwfV8qmFShI8XFvYE5TqP0
	g8IG1ArjacrX4VhOoa3rsF0+MD8GNHNK3Mg0o696UWLlDpvC+dnDKSewREk9t4VT
	N74onSt5yc/CLYkWImwnmxhooGFQrxRq3OauQjGly1H4FurLxvYMuZhKr8umbONk
	Dtiaa8KzgMQA3P+/5gZShhMKjcJwSc/CEPXVb6CKyNZXfqEe2m/Iq1Ru3F5gJFKU
	556oIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rync-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 06:56:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc860066a6so39251145ad.0
        for <ath11k@lists.infradead.org>; Wed, 13 May 2026 23:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741765; x=1779346565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOOJkS0Nd5Z+bZiqJQePyXnIYm4EiF7YiYsc7T/csgA=;
        b=JqsR5jArSJFYklzX7iqYz7f9L+V2K9Vjful0HYPl7SSjdXW2wWPGSIux07tirATbIN
         GNrAL+rADOJGU7OtKc/6NjTAsrIJFbbdHhZUxZfT2D6aI3Xi3kSdAoiZRNqu99dMOyQf
         QDWArVsFm1o4VdKpSfFndzLeZjKxLzK85L1TN3o15uVfHu9w1RE62e2dKwBIyZrLsVtc
         2sYdBy4wiv4v8T12GLuuheis4Yf0JM1+Ya2457fUrXvp5QkvsetsJAq+2S+XUcxlYOJi
         x2oTHPTwgBFvBRAztLSSuHaYAhD2RWLoX59kU2IfoMQsCXrKeM/PIUfuDzv5LevDEqbc
         3TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741765; x=1779346565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOOJkS0Nd5Z+bZiqJQePyXnIYm4EiF7YiYsc7T/csgA=;
        b=HYd6gwYgopIfR3PcQmMEqvrPL0jBpJpm3UXunDFgU6PBaI4DPPflJI4lu/1lJ9d86S
         JubNUT5DtJMvR6H3G6Hy6FmNi/1ciZ6BwytJm5krJGCBdUfkzr22hNNxah+meePQDOS8
         Fsmw0usjAF0ydo2FLrk34szwLiCfcGJBgUvks5JS4v0lOJk7UTaobHuuwhflfaLGnOg/
         s8GnpSbgLMkKS8cqZTGCx1bKT8HWwtVRdlssAk5PkEx9w8KerOdiPxqgcYgd1dJpDkAO
         fqJz8kJLbBg6srW9bCec9QrqV0sMOsNagOANvReIk7JjDBDy2YVvYgQTvjyvqmZfUgT1
         I8zw==
X-Gm-Message-State: AOJu0Yx6EZn+SOSbwyiISW7+hyfTRaFUpK77P4lZU/LUi3no/FMMAe6n
	jKKErbhQWKS2SqBzO3XC6MWiKpDuSvif0sfg0m6lIeqtzaM5yK1Az2Yh0n0faRvVcd/2oJoqxQt
	ThuK40k1BCqhb4zwt9jvMmSlm8BWktJEeSH4qcRjN0zbCYZI17x5fmHjtgPBnVXMS
X-Gm-Gg: Acq92OG4Pgzpw6BPuqa2g0fLssDo0KcebBvbDnG51Z820R4pKdbjLGbzKNTj1wPzt0w
	LI4JuXpJsBzw0ctae2bvdTir62D7QfNZpYDS+nIhtbn0Ht3jMxuM3FrRNEnOpNhG9Bh89yVFa++
	yeJnEWo/B8qAx6bH7UAnfJw2g2Q3W2jINyxg9Kv6Gx9Rjz4hVW0H019EpZMi8isb4nL1tv6Klrv
	zavIRsTDQxbTB1V7eegUORjXaQW6KV6DLGq0vJJbUs1MLDMAAvo+adBJpLwUUAb/DVptGgn0rS/
	kF/HKihlFuj0HzvD9bSJnyNzZ7wxKn06BS3cL8iLYHUcsArR7mhI47l4lgrRT/EolvSVNu6fhpH
	LYghmQ9v9ZhIkOSqjYvPhybKBgXHJigZIEMOs/zHW2umv04u6qfNSvbXpo3ZIFg==
X-Received: by 2002:a17:903:907:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2bd2713c355mr71238115ad.5.1778741764608;
        Wed, 13 May 2026 23:56:04 -0700 (PDT)
X-Received: by 2002:a17:903:907:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2bd2713c355mr71237815ad.5.1778741764132;
        Wed, 13 May 2026 23:56:04 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm14120975ad.28.2026.05.13.23.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:56:03 -0700 (PDT)
Message-ID: <95bff017-3554-425f-ad8e-767f9cbe1277@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:25:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org
References: <20260507070808.367442-1-jtornosm@redhat.com>
 <20260514061841.9517-1-jtornosm@redhat.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260514061841.9517-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bxFBzShaenY5jmSJ5hyOVUtai6VhULL4
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a057205 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=M9fMFvqIQJQtvAFehJMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: bxFBzShaenY5jmSJ5hyOVUtai6VhULL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NyBTYWx0ZWRfX22Jopa0gjNmi
 3hp6pleiC2M02E0MbyOvZd4vuOzKPHaw0XOh/VTJL0vEI8UK7lR6Pwc7QdnGVGKSbNxZ3x/bw6v
 rSbUt+hhYoy8hhIMaWV4XUZdBFAN3PeCKwOkXyM1RpQ51YHBGz3FjYVqjNzVZhdU+eWGuEEfULh
 sgf4vSMKkb5HesQvh8yi0shqHB7j0LYQ2Qn6xPziuyd0FLJyZ2BjeWZHqSGaUR5HAAZpA76SENG
 RCSRrFoo2baRrV+uPDgaPjaooAU2wPHyEANmFP/YC0vZs1ik3P84ITXrVGDUX9R3gHL2oJMIDtV
 EHr8iJy0c0wHMMOJdRJBL5LtONUuU/94LIdt/B4gdW3v93HPydWFOcqolgT4+0ihDP5bfYCMjMj
 lLsRVOMrOmLs9OYmzPSj9JWzNjNuuKHUbuYN25XIxPBjgRiTx60KdNTjwMepUKQrH94Ib+Ged3G
 Ho1qcJ6MT+mytgpi1Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_235607_093958_A5E616F1 
X-CRM114-Status: GOOD (  19.97  )
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

On 5/14/2026 11:48 AM, Jose Ignacio Tornos Martinez wrote:
> Hello Rameshkumar,
> 
>> I agree that setting tx_status to NULL makes ath11k_dp_free() more
>> defensive, and it matches the ath12k fix.
> Ok, I agree too.
> 
>> However, i am still wondering how the second ath11k_dp_free() is reached
>> if ATH11K_FLAG_QMI_FAIL is set.
>>
>> In ath11k_pci_remove(), when ATH11K_FLAG_QMI_FAIL is set, we take the
>> qmi_fail path and skip ath11k_core_deinit(). So the normal remove path:
>>
>>      ath11k_pci_remove()
>>        ath11k_core_deinit()
>>          ath11k_core_soc_destroy()
>>            ath11k_dp_free()
>>
>> should not run.
>>
>> So if the double free is still reproducible with QMI_FAIL set (with the
>> change i proposed), either the flag is not actually set in this failure
>> case, or there is another path calling ath11k_dp_free() ?
> Let me try to clarify the issue more.
> There are two error actions:
> - First the previous error. I reproduce the situation as I commented: running
> in a VM the default upstream kernel (with this card using PCI passthrough),
> since this is always failing. Let me show the logs in this situation:
> [   15.906564] ath11k_pci 0000:07:00.0: BAR 0 [mem 0xfdc00000-0xfddfffff 64bit]: assigned
> [   15.926520] ath11k_pci 0000:07:00.0: MSI vectors: 32
> [   15.928572] ath11k_pci 0000:07:00.0: wcn6855 hw2.0
> [   16.984192] ath11k_pci 0000:07:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0200
> [   16.984351] ath11k_pci 0000:07:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> [   18.186971] ath11k_pci 0000:07:00.0: failed to receive control response completion, polling..
> [   19.211036] ath11k_pci 0000:07:00.0: Service connect timeout
> [   19.211815] ath11k_pci 0000:07:00.0: failed to connect to HTT: -110
> [   19.214181] ath11k_pci 0000:07:00.0: failed to start core: -110
> [   19.531989] ath11k_pci 0000:07:00.0: firmware crashed: MHI_CB_EE_RDDM
> [   19.532930] ath11k_pci 0000:07:00.0: ignore reset dev flags 0xc000
> [   29.259157] ath11k_pci 0000:07:00.0: failed to wait wlan mode request (mode 4): -110
> [   29.259229] ath11k_pci 0000:07:00.0: qmi failed to send wlan mode off: -110
> - Second after this, I commanded the unbinded (ath11_pci) and I get the
> warning. Let extend here the stack trace:
> [   24.238198]  ? free_large_kmalloc+0x57/0x90
> [   24.238199]  ? report_bug+0x16b/0x180
> [   24.238210]  ? handle_bug+0x3c/0x70
> [   24.238218]  ? exc_invalid_op+0x14/0x70
> [   24.238218]  ? asm_exc_invalid_op+0x16/0x20
> [   24.238224]  ? free_large_kmalloc+0x57/0x90
> [   24.238227]  ath11k_dp_free+0x99/0xb0 [ath11k]
> [   24.238275]  ath11k_core_deinit+0x12b/0x1a0 [ath11k]
> [   24.238287]  ath11k_pci_remove+0x7b/0x120 [ath11k_pci]
> [   24.238294]  pci_device_remove+0x3e/0xb0
> [   24.238304]  device_release_driver_internal+0x193/0x200
> [   24.238315]  unbind_store+0x9d/0xb0
> [   24.238320]  kernfs_fop_write_iter+0x13a/0x1d0
> [   24.238330]  vfs_write+0x32e/0x470
> [   24.238335]  ksys_write+0x5f/0xe0
> [   24.238336]  do_syscall_64+0x5f/0xe0
> Very easy to reproduce.
> 


Thanks much for the logs, that makes sense. The timestamps explain why 
my earlier reasoning did not match the trace: unbind reaches 
ath11k_pci_remove() before ATH11K_FLAG_QMI_FAIL is set by the QMI event 
worker as it is held up on wlan mode off qmi transaction, so remove 
still takes the normal ath11k_core_deinit() path.


--
Ramesh

