Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B7FCDB470
	for <ath11k@archiver.kernel.org>; Tue, 23 Jun 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=; b=dCnwfQ6YIiMRLbNATjNOEkxium
	LyiyE8tfrTwcEWKlHP9CUfApUBlFV1cIg8zAw8a1JIn3NduzbZMUiMIhfzN3mLTGWiBwHc6z/J552
	nwk0odDo7i2Of1vzO0Crf0QZwfCfPIRJqQtUvOZl9KwINzD8Iw9kmi66SFDYFNMYJKoRVu1/ZD0ts
	casQkcCiq6VIL22ibfw+xjStsH1ysSPWQh4SlosNqduRVdtuYUZ7PYH193cyb8vqG98FghbA8y4xi
	Adgcd0R1EOVYaccNcidNNt4d3uQLUGcimwL4Fm/jPpe5aXLS7gBYMvLxiRl7UNRSPNHHuIIwVboWq
	a9VvTq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwvC-00000005wa1-0hkh;
	Tue, 23 Jun 2026 08:55:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwvA-00000005wZT-1Gf3
	for ath11k@lists.infradead.org;
	Tue, 23 Jun 2026 08:55:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7j91Z1778180
	for <ath11k@lists.infradead.org>; Tue, 23 Jun 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=; b=n3ubBrYSXQwWXHI+
	gn4nI/HCD2XOGpUVDc68k8FNLl8ckvJt4bupL2cd7rzU1Tin2PLb2rPXEosaEckO
	4G/0VFrJvimVOnmWviT/Szx0CzORjh7dT1ftcG4i6tl4+rD4E0DLG8m50AjpaXMg
	6QDM/OK3nBsZm2jalDsrHNDWxOqGfTbz4XYMUCRZka40YX3x67AEfBkWerBY6nds
	ZDELP9IcbVG2cHuwC53wFSF0RIy7k/vdXmDtkPfiyvYvt1/3+BtCDW/5fTI6Zyzq
	I0O/djCufRrhZ/Y/3VZjYYCatRvbDj4XeueKoJgV3jc5pcigEWnudrY5+w7Rp4DM
	u6gOjg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gr8en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 23 Jun 2026 08:55:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso4627166a91.1
        for <ath11k@lists.infradead.org>; Tue, 23 Jun 2026 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204947; x=1782809747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=;
        b=ZlX8okO6aWCKpc53Ufyr+5iBFhdLFic2naV++o6/4Dv2zQWD53yiIh1VDkNvvyzy1K
         B78tp/tLD4wZ4+cmSG3F0EcGdMYFTf2ex3c8Mbj1bnmMhbJSybLSC/4ooD2lc3j+TFK5
         cvggD0G0uQtPf4cBbFGJ0+RNLqRyDu7z7qwGTVy2yLKa6GYRAhRak7cS5IG8SrSI/d63
         +bS+UhSeYi90UXooFJo5bKxwwq5MFZ4BqUGpf4UJkqrouU9h5oQQ02N4R55xDxH2Vi69
         VPRp/SmbyJCkQcCJAuz8OGEGEPePVrftx5yrE4QnTmJhq1ypz2BKjZs7IT6ek3SdwfUb
         oceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204947; x=1782809747;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=;
        b=TehypCTNKgezewOd3iMnHr6JXo9QqoQ3V+xy6Y+TG4H1bhRlJb9svF89HlCCa6838G
         0Zjl5wbXEXDIdatOhpFakpOo8ARCSre3cobPT1zJuqjzhuX1ahHoNREYROphe1xLlver
         ljvHVNIYle31AKu9lLV7maX5bFKOQ7Y5LNLJWWcjNBaBD/9/t84slF5yedVLAPr6aB/0
         rA09Pq96H0tQ6Qa3dIGjiLBT1nlHOxmz3WGMMOkPJsZ0dxs0n42Lzvcrd4udNfkmAPh7
         q/jTVnhB8OFy3BUjT5zTDD5tBkxN8b01CY7dkB/TxMoFl3kLgkBeuc1bO9BxuOIgTSL/
         4tRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GDt7Xd8T+zc7V6W1ppyV2VWVnZYEm+OGCo6Pir5Cnm734iCiBT4BcXgHHMscBukWKKQCxTpE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2y+UoeQeKQBauhFB4AtaUIzYdp+ud3SDj5K4YgGzr6j7/Qvl3
	kI/Odo24vvUn6bkF3TrSKVAS2qodeAlqnA18PP/aHIpWj3DdSqnzLGugdOl4BDvXuEu0CPlk0m4
	Va/QmSpegFBk4wcE6ssB72HvPc8Vz5oSEMfHQiRtsni4/1YODKrOdEVS1EXgSFXuE
X-Gm-Gg: AfdE7cmfw6L3lLaaX8cM/Y+wR5gWvkjq+WPex25BH4zuj7FNB6bUPKQjdJiCpJCG2Bj
	I6EF6BS0dFyuWxKYbGJd5hcvtSF2PQoawlM90/HF+IIH1Ko1uOPbGKZ/LFtmXfNg77LSmjGCkM2
	CXIociVJmhYM6Si8WVLcgeHj5UOrg8XryaxCUK8VGjRzmgff7YiDEvQSPOT2aLI36iGYJ7LPQQo
	R0YhLcGEO8O0inpVahVgq+uCxi4dlmXl/+rG1CiJmyd7MLmOacUJXe3PPUXyDq3gpm5BPjBBh7W
	gBYvk3Ff09g1HcY/AvnvlPN/qrN9cjJrJIVbRFtBjJXg+crc1GeFnQHQtrgOzFXjWMIa7UA/42f
	SHQ949phnGBSEEW6VnUwRVnAIubv9X1xYLjtWpuUU+Sq8XcZPuMnEfX4ecb4cM4QsGntTWOH2rp
	FDOJLw8fTS
X-Received: by 2002:a05:6a21:4cc1:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3bb3404fba2mr20581557637.33.1782204946639;
        Tue, 23 Jun 2026 01:55:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc1:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3bb3404fba2mr20581523637.33.1782204946165;
        Tue, 23 Jun 2026 01:55:46 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3212sm10209394b3a.55.2026.06.23.01.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:55:45 -0700 (PDT)
Message-ID: <5abb5812-cdd8-47d4-b5a0-33f7351589ea@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:55:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, mani@kernel.org
Cc: alex@shazbot.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        bhelgaas@google.com, jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
        mhi@lists.linux.dev
References: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
 <20260618063309.9536-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260618063309.9536-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a4a13 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=_kWzU8USZtXapjXelIsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8UhC1ngGIu6XKDYNiYGdBODOv207MZkC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX1Ba3NaCNgUjG
 SB9e+WYRT5NZRTbyvd7tZI00GlUtRlJeNk3bqmDTuhffK1RrrafXVgBMozA4DEcWx4OU2WbWayn
 iozzNve3/dL698hgYxJevUkbEw7HmbY=
X-Proofpoint-ORIG-GUID: 8UhC1ngGIu6XKDYNiYGdBODOv207MZkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX38d7t9SZy2Zi
 YE73UFPP9mc6jknO8SZVRTxwoR4w7BxYz0fXlwzNe/jrga+ELNOmV0SEiwxw5SHbkbaVX66Mz5u
 CXoMrqJCjCQB+vigo8slc6izUtZHTVl58CpNiyqk1R3UGhlHPK/JBJ67u7DUrqU6m9qOQc6ujjG
 WTMYJn8Z5uhGMvOThNna2DUFRBHEInNW1MAn6hEr2b27Rfu6Y/scM5ET2pAX+4GIvRjtR6VgcAG
 HATomTRKboK/BbWFQpQ4gFw5TT12UVD+/deO0nDiUxHeoJGnkLNHtgHIiVNvYgwvApIzgjfoVhR
 riRhhwi1Lz62lEbGQ1peWDPfXZN23EyUbKcHNT3uRMe+ULaoWMBvhb47oUpyN9QhUekkYZWDP7d
 gB/fCzAMMKseFfem4naavRwyrFKoUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_015552_341767_963A1432 
X-CRM114-Status: GOOD (  22.95  )
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



On 6/18/2026 2:33 PM, Jose Ignacio Tornos Martinez wrote:
> Hi Mani,
> 
> Let me clarify the exact scenario and where the reset is necessary:
> 
> * For the commented WiFi devices (WCN6855/WCN7850):
> 
> Standard VFIO passthrough flow (this works fine):
>   1. Unbind native driver (ath11k/ath12k/MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver → device works perfectly
>   5. VM shuts down cleanly → device can be reassigned → works fine
> 
> The problem occurs with unclean VM termination:
>   1. VM crashes or is force-terminated
>   2. VFIO tries to reset the device before reassignment
>   3. Without a working PCI reset method, reset fails
>   4. Device stuck in undefined state → cannot be reassigned to another VM
>   
>      Unbinding the driver again doesn't help because the device hardware
>      itself is in a bad state. From hypervisor:
>      $ lspci -vvv -s 0000:03:00.0
>         03:00.0 Network controller: Qualcomm Technologies, Inc (rev ff) (prog-if ff)
>             !!! Unknown header type 7f
>      And a full host power-cycle is necessary to recover.
>      

what is the difference between a clean VM shutdown and an unclean termination?
specifically, will pci driver's .shutdown callback be triggered during the clean VM
shutdown, and not be triggered during a unclean termination?

> * For the commented modem devices (SDX62/SDX65): 
> 
> Even worse because it fails during the first VM boot without proper reset
> capability, standard VFIO passthrough flow:
>   1. Unbind native driver (MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver and crashes:
>      [   24.024165] mhi mhi0: Device failed to enter MHI Ready
>      [   24.024168] mhi mhi0: MHI did not enter READY state
>      
>      Unbind/rebind attempts fail:
>      [  352.643601] mhi mhi0: Requested to power ON
>      [  352.643611] mhi mhi0: Power on setup success
>      [  373.442954] mhi mhi0: Device failed to clear MHI Reset
>      [  373.442970] mhi mhi0: MHI did not enter READY state
>      And requires a full host power cycle to recover,
>      even outside of VFIO scenarios.
> 
> * MHI Host driver's remove callback may handle clean software state
> teardown, but it doesn't provide a PCI reset capability that VFIO can
> invoke. VFIO needs a reset method registered in the PCI reset hierarchy
> (device_specific, pm, flr, bus, etc.). VFIO invokes this reset both during
> initial device binding (before the VM starts) and when reassigning the
> device between VMs - without a working reset method, the device cannot
> reach a clean state for initialization.
> 
> 
> 
> I hope this clarifies the scenario better. Please let me know if I can
> provide more information or run any specific tests to help investigate this
> further.
> 
> Thanks
> 
> Best regards
> José Ignacio
> 
> 


