Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2953CD3436
	for <ath11k@archiver.kernel.org>; Fri,  8 May 2026 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNZcgmPe7g/gugoXZYXQBUDZ5/5M8HR0b31ktIIL+Mc=; b=TvLe9IdmW+Z+l3oMUxa1Aod763
	DoGkPinuwA0Fhnz7Rretn7cn1QG/CMS7tgJ673c4EciamcZMeQNCAFncurSDaa1yTYAB4h1ixzpG4
	skoU36ANKj+Aw7UZBLCNQe4gdh2HxJeT7EEjHVKcNCzEGfV7DPwMg7+cUA093DD+HdEK0iYXyC1zQ
	/apr7m+lAQTzvvEoEFfj4b2+io/jPHBAzyl5bzr0IiPQtHoLjbFe2XL94G+KSKRhEPZpy1NRyJqvM
	I/CnCZFu8EJ+5JZ/xEriXm63+t1z5qHCaOJqkwHm+xkDIru0DxZ+5rwUuLcZVGZ4b0seVAFboACi1
	arm4LxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIH0-00000006CuA-3DZ2;
	Fri, 08 May 2026 10:17:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIGy-00000006Cth-2xBW
	for ath11k@lists.infradead.org;
	Fri, 08 May 2026 10:17:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGoN257883
	for <ath11k@lists.infradead.org>; Fri, 8 May 2026 10:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNZcgmPe7g/gugoXZYXQBUDZ5/5M8HR0b31ktIIL+Mc=; b=gikB54XqvkG0xuS7
	dZHNuMztip0HvVoGq+Nls9Su6YfPfstBxP9BafYf/gWGuv1qyl5xyxLr/rUsYg6Y
	oIoLOTipJ/DOo7Q16+w/5g4R74n0/l6RGSehLdHpkBhVTUrPjUthTMC7TU92FzG3
	FNLvk1XsFdgqHLROZvRamgIR2h62bsU6bj5547g8pd72DCFrHBc7h07x9e7+etjl
	Z+VCwTxLMmH+9n+/9Q1Ipekl0YLCL1H43sXdhzCBKwwHFt1Tvt/xEl2mgJQWHPHp
	B+kI8XwS+QjDnTl0/w6iiDkU7PBBK5qsZTwv/u0g3Fqq0yup6CST6Raik4x84TQi
	Md/jgw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegsqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 08 May 2026 10:17:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36781927b4dso59682a91.0
        for <ath11k@lists.infradead.org>; Fri, 08 May 2026 03:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778235450; x=1778840250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNZcgmPe7g/gugoXZYXQBUDZ5/5M8HR0b31ktIIL+Mc=;
        b=jJ2GZBbWSWJoE/VZ+Yu+uPipg6MK/zGVLO0loSiSoL8Q9/ooZdUm6HYTRlddnKldgH
         3C3U3uXNDgcyA6qJSoW2ElIyT8eOvjPblD8/teawhd2UUMD5xTKQgFtDiBaC4ax1BcYU
         v9JhdY0/xVrsDeGpIvz49IxIE2QSvag/lx7O5bB2hr+QyiS1dojKMBwGdQLgg2XiDFu+
         QKtG6yNM7NrzwBb6R6tDbkO5rr5oHiDENOLAgGjj6YmH+bMBZ0NffhOKtqTjkVJHXXg+
         pNuaL0rBGIjjJ/up82kYVyejCWw+CnfZGJOkJkNFUXEUvI/IQUIf7JksQgyBdXbAEjtN
         ETpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778235450; x=1778840250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNZcgmPe7g/gugoXZYXQBUDZ5/5M8HR0b31ktIIL+Mc=;
        b=h9wJs4BWJFUkwF9cdFBWp/P9dBOWoogUvuJauaQvfEcYu/lyXz8QRnGZwJ2u8n6Onl
         E3WEK01WMK0CuhGzx3Tn5gIHphhhmp73O7mj/Nhxc4ZXbpFcVuPFc39fccQ+RxDxdJxJ
         7Cm0PRWqj7XpKk72Kpy0CfxVD56zB7OrJpDzvU85Rpv+Mt8liBxowGWl62vijVvnWxaN
         KXb6KbQgJqf3Rm66S2XN/I8ud94oJQlSk1kBSWdMUaxDIGthDH8wwrHme0bofPAlet9c
         EHlhHh9/THyQeG7yKvsiVgUoj6AqdD1ShiotkG1ggImIT3z3LXdD9AT30kd+IglUFMmf
         lhxw==
X-Gm-Message-State: AOJu0YynYqCEaOjgQprU2tQ2u0fAom7KVqk06UdYrdULNKyhxD7k/viF
	yWmLbwQLqHkjz9ETI+w5eCTrmbAaJKYXvYsuE3+rUURDR5wI+RIk1p4hg94JEXxDl7+1HOBbkiQ
	mPY6Icc+5Y9gzbJhk4plDXHIju9BO/j+X6wf7aoQcx23wm4FKeo39gKk2OQ97DeVa
X-Gm-Gg: Acq92OGyGOidmqnz4uzRdKRqjWOmGpViq16jD4K65U3/4an6Bnuj+T5Ai0OANC0yJnD
	jX3z4Klq3Rg1syw64ntRM3O9MXwcRxcKNpR90D7AsY9+rZJbYSvohdjp2OdKMGgJsei5UozBGrI
	rPofIrg32bYSuhElrZkRS/chloVJn/VAhEAeWwBIks1qL7GHYypgW8QXcXAWCx0OuWRJ9zvPvzY
	W5tukmS/MwILE7eBWZVBm8GwPXrsPt8jFCOXht1qyDCELJu/6ggE9GJqdZGJXLupv2tT5hpeSKH
	1oqhu3omwodvpeznPlN4L4wtnl75Ud9B4qIap4zGC+CVfvxvC/PenA/92O5KRQ6px5UJ6Eg4xut
	7yWiioAoo9VF+gKMx81660VTgY7CKwjttX2jJMtC4YridWYg5JJHi/Yq3U+hs1A==
X-Received: by 2002:a17:90b:1e0c:b0:35f:b75e:fff5 with SMTP id 98e67ed59e1d1-365ac4786f3mr11550143a91.22.1778235450454;
        Fri, 08 May 2026 03:17:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e0c:b0:35f:b75e:fff5 with SMTP id 98e67ed59e1d1-365ac4786f3mr11550110a91.22.1778235449882;
        Fri, 08 May 2026 03:17:29 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-366495998d0sm951408a91.5.2026.05.08.03.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:17:29 -0700 (PDT)
Message-ID: <336655c6-4dac-46e9-a783-549f0a9cccea@oss.qualcomm.com>
Date: Fri, 8 May 2026 15:47:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org
References: <005af843-da19-4df9-af67-2cd148b24d62@oss.qualcomm.com>
 <20260507070808.367442-1-jtornosm@redhat.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260507070808.367442-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNiBTYWx0ZWRfXz9L3/HM46kN6
 sdZXoaHWoYkm9eDqoVJzIK2fhjHSnt5kF/FGJd1VVRCERNrV5miEFlhQhik7qcoLI97qZsGLOLP
 nYlosH8G8yW5Ixh4GNzoT6Qw5l6Qt/eSJ29tmshfe1PoI1ITQo1138X/mw1oc2EOLOG2mXBaQuM
 EVjsnW+5DiRRAMVGPX3YbkWSJxX/kOkIZhoCFXCXjIiWiA12sFnd+prYBvDfOJ8VQwd0na7UM7P
 sYuY9wIrnhi2OtTeyaIbDNIYA1Z5zKt3ZRKzM+jIL/m1fUDfS9dmeH7/kTE3P9mxSD6aLCNJ0XK
 LaQCRoW16atLTcnckk+AMlNiBC02tcTo3UPbAFpY6MKMNRQ+cKA1R7bJBtNnbvKicQtkT6RvIm7
 r5Lrq5wKoVfhiKRSz6mc04IiBwfroMV8CAx4xGzFdn2pYoeXZEaxQ/GiP0pn9uYCFiFTO+Sg/AG
 J4xCmYt48NKsd7X9uWw==
X-Proofpoint-GUID: NFHd0KgHAyl5-s1KXTxJJVNJDvTiyvf9
X-Proofpoint-ORIG-GUID: NFHd0KgHAyl5-s1KXTxJJVNJDvTiyvf9
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdb83b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=zWE2KlgL49PTva82SeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_031732_863527_9647EB38 
X-CRM114-Status: GOOD (  21.92  )
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

On 5/7/2026 12:38 PM, Jose Ignacio Tornos Martinez wrote:
> Hello Rameshkumar,
> 
> The hardwre that I am using is QCNFA765, but I think it is something
> related to ath11k driver and not related to some specific hardware.
> 
> I am running with the latest upstream kernel and I can reproduce it, so
> I think it is not related with the problems that you comment.
> 
> Let me repeat this to try to clarify:
> 
> The easiest way to reproduce it is to run in a VM the default upstream
> kernel (with this card using PCI passthrough), and since this is always
> failing, just unbind the device (ath11k_pci).


What is the exact failure? Do you see any driver error logs when it occurs?

> 
> The same problem was fixed by me for ath12k driver here ca68ce0d9f4b
> ("wifi: ath12k: fix warning when unbinding"), and I have seen the same
> problem is also happening for ath11k driver.
> 

Got it. I was just thinking along with the proposed fix — whether we 
might also need to handle the sequencing on QMI failure.
In other words, do you think the issue(double free) would still be 
reproducible if we include a change like below ?

index 1397756d6251..5bbb53a6b404 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3295,7 +3295,11 @@ static void ath11k_qmi_driver_event_work(struct 
work_struct *work)
                         clear_bit(ATH11K_FLAG_CRASH_FLUSH,
                                   &ab->dev_flags);
                         clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
-                       ath11k_core_qmi_firmware_ready(ab);
+                       ret = ath11k_core_qmi_firmware_ready(ab);
+                       if (ret) {
+                               set_bit(ATH11K_FLAG_QMI_FAIL, 
&ab->dev_flags);
+                               break;
+                       }
                         set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);

                         break;



--
Ramesh

