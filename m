Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762EEE92FD5
	for <ath11k@archiver.kernel.org>; Mon, 29 Dec 2025 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=; b=Uy4Y4FT4HY+WEDGVGacEEVKjJ9
	3ptY/UmRqIT6Y9cmkTl3rlVa+twKtJN4qlDPBIQv5gEZBGzdIdmZszMgUuD97BE4rDYBW0NZ8ZpdG
	iMtjRo+1UzDBmnskSnYhvbz2aRrRwmHVlYcRRApn8fKMsXwV8I0GrAUhcfoUbzzGPNNLyYuwqqjj9
	T9kzH9xUxnfOeXUpe1sxy3UIMTQTgKxXl9s7896JD4ugvDY2/EDWRk6V/kLs9AonIiQlKWMLcJh/d
	A4qz8VKCeUQX4Vbx+la5p2700N+DM8zW3QgW9G/i0F0xnEqwFPjfDtNEZVPqXQnQMOZkfMatDznF2
	ryJztxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJiv-000000042dz-1hDv;
	Mon, 29 Dec 2025 20:20:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJis-000000042dE-2eG6
	for ath11k@lists.infradead.org;
	Mon, 29 Dec 2025 20:20:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAIY0N4079884
	for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 20:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=; b=DRwYQYc6xXrnDYfr
	4zRQWdR3gjE1qZXQA0FLzBPH7KkA61L1rU+1UwsFW2KeVAg4ylPLhHzsLwcVreoX
	RBdj6tQj9QdRrgeLzrsl9GpeAnO+WoQdhvIEUBuimZ9l/doWI6ATiXrc9yweeazI
	0WGbiS69rwFLUA6BPpDQDeXEmw4d/qGbTHIsUTwP9aVSSxNsunYUOzvw1gSlvW27
	Z+BdYghv3ZbMC269yXSZDBdNq0HrXwcTmJebFHgnbGo9qXqrwliIMQNXSlZGqjrQ
	U2VvdGIzyWc78GnzV4TFHUmOHt54ps1lb6YANvyCvR1MDQXnnDmUngnPDhMu9DR+
	OcPABA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bwaqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 20:20:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11bd7a827fdso17718505c88.1
        for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767039608; x=1767644408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
        b=UD1c4Px74vSjPUGPQ+50kXMb/oRX0iMqh8cijBzJzyp38WJpdinzqdH2LAlqwFl8Am
         p/UddaxSCCTH9x3p85enTu+kZK01BxKzaQ4KwcqBAG/OIkRdYmJR9vOxT3gQInftD+gL
         PtXQuJ976wauNGQiFixvch1KPpiqFf/I4oAszcJXm3Ssa1skRlYXSkGGlSh/R+6XPDj2
         596RocSaEQ0cZmFEaydWv4UGXk3NVBzRMmOthexD1WTIuR8ZTd+mNRMtokqNL52Aro2F
         F0kJuevZlTkOdSfIWRi/SB5+w6/Rfj79S0CTId6mSli+t5K53IV+olocf27SmU/ndZOe
         YbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767039608; x=1767644408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
        b=C0DqVYWFpaJRwhebcJzWkt+nMzBy+OEfe6TwGyb92fxNvnL1E+dQP77Odeq+ojZfkw
         g6j6hBBI8gjCjQu0p9FoPHkGBaiTn+AjCxtrHvjOOVC3VPO8gEJC3qXWHGKawCvuvSs+
         3klnu8OrksX/YZnerpC34RKR7m1UOPuOlmyubNzGxYgyTX/x6QWjcxktG/Sh5uIaX+9r
         6TCD4Y1Ka3q+Yz4/5xsKINtWJru/bZKzlAjw5v2PToOd6zWetkcvSXNXvfpqGe/6wzNS
         LuaUjDH5fAtRdbgcv7AiXnUxOCl3nIDOEyptYK5Ub579BBjNMH/v30lR820jDJu/HrGX
         0fvA==
X-Forwarded-Encrypted: i=1; AJvYcCWpaLbShtmOSS78lqSJsz1vPKMJW8vUs54MveqIFb+7mtNQ/adjDFS4eItZkLIXHmGWsKvd6O8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7tMEnr4l+cAib1zxriHsWJcSOg27r4wwAE+RA8GohBcjVQJVO
	Fpfi7bgG3y14h6ELombTSVFQLhI+5H7S6uFFY/T/a247gJszq9sl8Kjf2gCLmFaguEh2GN/lced
	g/LeRGvKxtjsqrorfNjBF3TwmC+TjBV+Nfg0kLZFgYYtQkxGk4cu7WBJM2MKdj0R5
X-Gm-Gg: AY/fxX7rZH+WeTC6OA+3zp6mnbbpraj+tIt/72hMl0gvRuayC7VisOsXFVGLTMFYbLM
	xFcaOP8i3VO2oQlS0THmpjPhPpqfruPVOdTDcfhUpmxPdOUDX1lARx3pZeq7WREt3J+Dhw1Vld0
	Z0hxPSAyKebDH/2uF+pkUBUFS0HEXFu9uCzeTgTYeEBFNKCFEJXuFJkN5Qmazl0C6SVgU2SlMdq
	epHYFHYeO7SH7muRxQjzUe1jeK2/r65jw5vZu5RAhhK5x3qdCLu9fv1h3IV8YTOkBXoK0XUSJrD
	teo1okbnJEazqiVG59PRz0LCXVjPgdT/T45OxuvXjSF7Z2nD780eJ9CdfE8cDhLT3aRbEKAubvw
	DNxw2De0xyr8nYpH6s+1EKLbl9pE8aTDIPjv7zZ7fqz5/aTS2kNwRvS/WH8DgM8Y=
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id a92af1059eb24-12171afd95bmr24941772c88.23.1767039607741;
        Mon, 29 Dec 2025 12:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/lwK2wTaR4697pd1i+xemc7zfhrLFxVX/r/0pN47IvpGex944GuH8FMyKdtpVLY3DVSOxHw==
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id a92af1059eb24-12171afd95bmr24941750c88.23.1767039607116;
        Mon, 29 Dec 2025 12:20:07 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm117915702c88.9.2025.12.29.12.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:20:06 -0800 (PST)
Message-ID: <60aea371-915f-431d-88dd-3be633dc2bcf@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:20:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7VURV0QInrfksz11b7tJ2Eg_VP5_8cXr
X-Proofpoint-GUID: 7VURV0QInrfksz11b7tJ2Eg_VP5_8cXr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NSBTYWx0ZWRfX3t0Qh3r/TjHU
 DIBkZJXtEWFRD9KnGWP2yNnkGx8fqcrnN4I2jZgP9loE+fjBnDSRBElyWk4CfCNmu7H77uSLJ1y
 gycWlLdglmSYm1gYwF4Rme9YhCFPsMAw305Xd3HvSQrhQdZnNfrzaPvJ5wLlasfAfAhC32ZRG9h
 N1gbho9tOlMuxamZjqsqQXYE8oiZZP1bNgBKUowSC+K1Lv0ijIauMQJZrv5tUhByM620mJ9T+GB
 mpVm+urS5rt2Lx3QrZDwAgPqfQzoixUXZ+yt+V1OvhADZMSkiKK4b1UDW8n7/VPH5cudmee0ILb
 A/MdH4FSj8EaFi3sSTCS0N363kcwemUy2kmupxBLTot8mywmucYd+BtMMPAbkoiKE/DXCi3Kr4T
 UvvqC7fEbftYxv3pOK6WCFq9uUFMw3GFBvuRET/gVLqCQgYUVVv1uImIh0uxnUGi5JyoCl13P7c
 K+EA8qN8c9CG9CL4flg==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6952e278 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_122010_681791_0F997398 
X-CRM114-Status: GOOD (  17.42  )
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

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

For the qaic bits

Acked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

