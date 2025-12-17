Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5428BD65C7B
	for <ath11k@archiver.kernel.org>; Wed, 17 Dec 2025 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=; b=Qwv90qStJRzBZ7327x+rErLKdE
	3mRQH+l50J1Y8Tlz8wwnAQ16O7MJITHsClstNG9kuvXLuMT2pzCV72mhLFVyY4OFYS/bHdnLFVN/H
	XewRSLKy1RNIcrg2x0YxmEd0iKnsMD14fNuByddWdRk6HBNJ5ncRt3jDyknlaVA3VaODwKw76Th2Q
	nV7n1KAaff0fJoWsYGIGop7erOdGU56bV0UK+3mdmx9Uf+Qh2Q26mYcvm3q+iswILElfYDuEg+GYr
	w4DFKgVQUQ0ZGdat/+E/N9awFjj/AzSAHHDalJjP7Uz6hHN7uWKsUtil/W2eWhYEJWZ8nRo7Lb9ZE
	6Ku3GwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw6k-00000007G4d-0CTv;
	Wed, 17 Dec 2025 18:18:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw6h-00000007G3y-17S4
	for ath11k@lists.infradead.org;
	Wed, 17 Dec 2025 18:18:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL0Uw2502769
	for <ath11k@lists.infradead.org>; Wed, 17 Dec 2025 18:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=; b=XX0FTlGhGcl0GgQl
	ByTU7cTPlDPk/BXambHGMBBrAFNZaJfIcs6xA6ew4ZJ9tR7UJQS+gqePcy3CuHsP
	vAotqv37mohmAfVk+eAvIYj7rZG2V0YacO0NNdP0m9w3yE0WWFoEoPEvo6maf4xs
	6DWw+J4IIVBayH2jAWjYTnjijGyHuVPMpR0JkPMA9P0/h03K2SoFh/RKObvRsWpV
	eE00BccsGUxbyFdW7MIQrXSXW3cfy70VmIAoj7vErrMdAHU142riKXQR00XrVdgA
	bnC0PryPEaCZPZzqHVwAwn49yCO1jVtKSjP0r7hhODK19mvYysQxYak3xA0We1cb
	FKeYhQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqaa17t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 17 Dec 2025 18:18:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99f6516262so16143311a12.3
        for <ath11k@lists.infradead.org>; Wed, 17 Dec 2025 10:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765995517; x=1766600317; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
        b=INuBH0ecSY9aIt4ywDoXhpBZEN8qqFC5fSL6ra929EWdbE8kmB3svRCgQHkxuwg9vD
         ieUhY5FKeAt2sA1GNXQVKX1D9t82C6wzacuYSUTBNeCE6tBjpIcbY5QgvPDdljc3YC09
         VB6P5wPBHdsIUOUFMqhhgvSXJ4VgMXUcN77eUCiIB7mMDso2lMys2PJq2y9qW5Phs2J7
         l9hXVIJMaNoUZPjGR6o5dkd72YJ2x6w/0/bSwC7e9nwvJxJ16C/iZb0VphB3qbtST/J9
         EEUtWJ1h7x/gP2b4ctf4xVaVJmfU4hrYmLLQJNFKBG/7eY7A4Q0cvUCJWlZ7bVO3ujsP
         Xhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995517; x=1766600317;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
        b=dgVLLcnAM/kYZBKJQ6rkpUStc/cRTUkbUADUljd72XvOJbJY4VzIE5T9hD1OagCw1L
         9C3+Wi2Tw84udPnVoq6tpU+JgKjRJBYoJv6G8tuJiuki8dQBUmURIiRamOuABgrTKSOE
         /6FCysq8jWZYAiEK/WiAXudqz+CLJx2DmlEGpnAtybB+8pPgIee9groiBtrNKKHZOFDz
         9qLv/hwlPWaMQxUG9BXeVKf9nfU6QYgt6S7d5DEOwP+cfnvuWiYfN4OVkQyeQEEDW9+o
         GfCLLIARupbUEPHHL1vcWQMcm7dHPj6RbY/U6doGrkjNi2w2BI1a58UIkw9YVXnJtBF2
         kWeA==
X-Forwarded-Encrypted: i=1; AJvYcCUA/V/+0W04GZNVL0N7h2UHBeZMBSjX/dKkeGMDLz0PZXsFKpHT38MEOoZQ3UD5YcejpkotnYM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfs2gB/C9lRjZ8NrYVUovYQ/6bkQWN+rJzA+WD/fO+3ZeVkZyV
	CBAC1rvxlavIGH9CCwJ4jEbYaG+W7nH51tKTm8csFxzAVA+GCUmGCq0wMoDLHnMLUoGg/OQ0UZN
	9p5xXqyqra2bQPeTSWVnKx49CojCRwl4gkGE9qsijxnF8zvZp1+q4jQWrbIQ6yaQ0
X-Gm-Gg: AY/fxX6uEEwpbqcyvR8XzgWpHGJ/0dJM8YWgP76DM4ywymzbWfwm1PImZjczS3iWb6n
	pIMIOMc2tE+XPPkapOFWgIFH9yg9nYcw6J7VCVinvQYw+MM0dHUliK1lz/wmdGJZx/casJAwBjS
	mC7qxukmdpJApcDyFygQl93Wv1IUXqudExXSFL8W+lU0OcUJILUEhuPYc1OWP6xAmZeEPVNro5W
	/Sy90ALkBATKrWv2Dc/07de5FbF36ADDQoL5AY6iWGeDhI/4srdKFXPaL7gZCypem1MLf5S246p
	acgR3Teyis0rxqMzp6jt/Q2OA0Po5AB62aiMzyTV9Upy83sYXy/XX4MKEbev6yrkEzZN2aolQsz
	z5NJ78zb3eZphSCrNeienzxy3ujTGDxnaDAfzubEsnzRY4KZq0nk9O7ivicXuWMrPGNaDQQ==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id 5a478bee46e88-2ac303958camr10594076eec.39.1765995517142;
        Wed, 17 Dec 2025 10:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6ScF6p2dbGaIAlfPTuofAf2/eZTtk6ONOKBGl/Qm27pAQp9ttnZa9kTtvsKTJrPW0AuH8SQ==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id 5a478bee46e88-2ac303958camr10594041eec.39.1765995516561;
        Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061a93616sm517453c88.14.2025.12.17.10.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Message-ID: <5e568034-20a3-4ed5-a8e0-c010e5aa7b82@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:18:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR
 DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
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
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com>
 <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U_GJkRQNCwRnsR-GH_2ITdqwP_-pVgHM
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=6942f3fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE0NSBTYWx0ZWRfXxjyxqEqQMpLe
 uyMihpKyg03JxsOuEp3vUA5Ky2wGTh/iZHzUVNcPCukueXQSkPInq8wtLaSJpSJ+Z1Mo9S2h3ga
 QDKoEP6S2eWWguN52K9BAj6XsMY7BDZEZpSvwtYiVHnUX7dbrPqq4jWV2fG/GSQymyyUj44XQBj
 62FL5WZ2ilpBs86oQjB47Uj17rY24GfwxrRiPj7t6vd+gqBE/uGdHxkQ5enL/kpfxoJyEwhVqDx
 /+9sagqN1Yij839GCI3ZzNEgi9R3ieLhqbXy49X4IRxPfZBoyoB+0Xt0V9kgyt53l5SbRYB+TTZ
 JCFU4RXdXmOSYHtTMHgcJVTJRca2jy4Sqxkt2E8cw11l/Xt1y/GDkt50AKzSXtj+dS9DRi76FhM
 rUVIDsOI2LX1lmaid9yINJqVNd3yyA==
X-Proofpoint-GUID: U_GJkRQNCwRnsR-GH_2ITdqwP_-pVgHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_101839_324957_A5B1C864 
X-CRM114-Status: GOOD (  16.14  )
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

On 12/17/2025 9:16 AM, Manivannan Sadhasivam via B4 Relay wrote:
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
> Cc: stable@vger.kernel.org
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...


