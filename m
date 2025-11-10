Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A762CCF9E3
	for <ath11k@archiver.kernel.org>; Mon, 10 Nov 2025 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=In2CglKkJlw2CPFhnxlidRKLUnNM/dvL9E32nfiEsvc=; b=pnjhbvbn8bwf8V6uIcS7moUidy
	umwCkH+A9ulJpj5vSdM1luMQWYXJ1Km12w/81liVNPDOu4y5BQIKwpFCCnhgzcp5ZRXOdBiT6NjRD
	kIsiXguUBJgs9C15zUmdUkBsWaBJ3jkjHwUWCPPpq41+89UsKb4rvkxhPX4Sb9hFlQHGplwrYC0Ki
	iSn3Lfoscvj4qEsMxxcfinLFN5FWtPEafpvPW6M0ZADIb7H3WvAWa0Ke+3Im20EHQpw/RAEnaqd/d
	IWyVcQdpPXmbOOi26Y3yeDKzeRivmPioTaJtXlL928Lbeg0M4ctmKFgobWC2ln2rZjcFhcYQXWImh
	IQfBcQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITOA-00000005dxH-2IaB;
	Mon, 10 Nov 2025 15:01:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITO5-00000005dwS-1Ryf
	for ath11k@lists.infradead.org;
	Mon, 10 Nov 2025 15:00:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8YANd1809151
	for <ath11k@lists.infradead.org>; Mon, 10 Nov 2025 15:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=In2CglKkJlw2CPFhnxlidR
	KLUnNM/dvL9E32nfiEsvc=; b=bUVZEtY144oYGi0W/MZCRu7JQPhU+Uq2uG3miC
	fjBRI1LmkUY86U+n9rrdcpI4UdmDaDTqmwkKLTE9dt0h/ruymIuz8gd2iq7Y2xaZ
	qC6LW7QRhM2FK7FXnpjIHXsuvGi8t7VyedlzXwQCpE7Rsn4PFXUDElxnG4ZRP6T+
	YXQFiIpZnVYGA0kLecCCnnVjoK90jnIo5D5Ne+qmWvgbLvC6Ph1xlCuP0WMI4zkm
	K9St+U2jr4reBs3f7pNkkAUhwzfn3vT3+1zacz1iEGghDuYgdf29hSrDEGR+UZsc
	0NRTEu0k1KSrQGFNbKbHK84bIVqlNWPf1P1bdNhhqhIAjeEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1j8w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Nov 2025 15:00:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a440d38452so5806129b3a.0
        for <ath11k@lists.infradead.org>; Mon, 10 Nov 2025 07:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762786855; x=1763391655; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In2CglKkJlw2CPFhnxlidRKLUnNM/dvL9E32nfiEsvc=;
        b=MgstI2AL6ucTjinj4L2o2tjdvfXTBp34e06dxUnbVrGqGTQV6b9gEG0DENQqwXqZxL
         yYHxQRLrXP24X/qtqciRfLuW3p22A6g6LnmhaqZZaeGUYVbZqYKjwpUgZ5EqVytVRLPl
         KbnMjqB0XkMLz2EMpgCJbN1bG5FMeVMTBvEhFptafi9QAr0obTfp+9JAEyQfJ8xuwbnS
         zZssr4zQ65lRK0F0vLfVeEno+1NP5ArspfBfxN9N7GBLt9s0RziWGR5RINJjBr2ad1la
         R1B5hpRquOJqveyPre68TgDrdSmov0Q9udXGXpT25c1lOXfj+vEUI57lHgqGUhPRpHP1
         44tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786855; x=1763391655;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In2CglKkJlw2CPFhnxlidRKLUnNM/dvL9E32nfiEsvc=;
        b=D0hzjTwIn6mV0vrl0FP9BrYuaczqVAH0aZRIas4FdhBlwcERHwniDI+GGimMH9w3IQ
         ND6JGXWQj1n8u2BUvEbMdfh7HQYhQXEASLCHgPss3lX6OANAsvArr++eA4fCsedh1Np8
         DYKpRNTLCQ/FI9JoWfciw5nAVpfAWk2XcHJcBwZEGiuz3d4NY0mBjEZvmAKPP6JSIQZA
         3AOR/UEJwI3EQHtRODgSJpPVc0WrqhOenAkLJ4hYLABkJZi+OWk2Fkb3gBh/dSuRrO7D
         P8kc7CQF0PeeWtK9iVu05jy5Ery3yjSJ1rElUOEm5xlm6fLRtEYrSBVJpFScAoqR17pa
         y6gg==
X-Gm-Message-State: AOJu0YxYQPI7geH7l/pmPcHR83j4kxAdCuotf7rNuJL+ykB1IIjvtZYN
	AI4JXc4d8aD4LlRseuEE4z9+9Z1sRCmgNivR9S8yzk+KUsOj0Z5CaAwlQZmkCvyKAV8iGu2eTL4
	Erg7q24ighVfxq99j95kdZZNBUai59tEB6m3BHDwHO05apimD6It/dXWkeGrS/8eNyPhpkcAO
X-Gm-Gg: ASbGncsZ/lYHf16YhuFL8ThjpuuYPqSpVvYUFpypELyXbrhZ6q4qpCY9/KTCw2A+sIh
	XSjqKge6/hxvxW0cHuRXjYVXhGX7xrYzlNu2RPnm7d11pmKYnT1l32srwBNnq+sjA/cVuSyPmXY
	zAHWvi2f6i+Piwj4CiJk3x7VDoLpy2bDKDv9mZrTELi3S89olWPgVOv8IQd1MKLhZ4KRVAUFivK
	tyCPfAdNttNrbDa8i5xfYX2OIhIOCXEcYZkXeJDS9dA22RKZaIIBWWF4T5C/3nRkwpPwKVqICMn
	/a1uHiwE3iN7OInu9bgkUvxlUdRjHV0ropw+eOgvvzdTXz7M7L0aV2O9wil+5Kc4XpnDSnglne8
	Hnk26OdhgLFh+TYlZdcTHSuoY/+KvMID0vA0=
X-Received: by 2002:a05:6a00:2da2:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7b2266a4f3fmr11767613b3a.18.1762786855099;
        Mon, 10 Nov 2025 07:00:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTjgRCTxMSJ9PxX2gFFU5nHFuD65wVzXEp2yytUimmLc3aFvNbJN7pJ+c/AoWSO+a/QxJeUw==
X-Received: by 2002:a05:6a00:2da2:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7b2266a4f3fmr11767447b3a.18.1762786853400;
        Mon, 10 Nov 2025 07:00:53 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09cd6sm12078801b3a.23.2025.11.10.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:00:53 -0800 (PST)
Message-ID: <b7bd9e01-ac73-4630-afe4-01dc57320b05@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 07:00:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: pull-request: ath-current-20251110
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyOCBTYWx0ZWRfXw/+6vol8Gb2p
 3ZKGPQa5mhjy+q2cpSbKEa3Syvtd1cY6z1Od7Be2sSXLWR+7qBcHsnxly4ughtj7OgwZDo35i6w
 /ut9/2zOCHy9hz99UEgChE8R4Ay9S5t4tQ/CfAfwInvKt4LU6Qht3SPBtegc/nxpLl2a7Jnld6p
 9Rby4vqihM/CiCa5VvP5cIPl6d3OAY0J5FTGaPo5RuztC+JcNAxiXYdKtf0Xorm91xqfNUFpFe9
 bIn2YNQFZkC6CBDTr2zkjk2CbvudMnCwMA0+LsP6HeyxwSF04BdMJ6yf+haxUgwdcybZ78LRcoS
 w+GW+W5kjEv1WYs22V/MeQSXQiPVOrgwv1OcpjNe+h5XEThKrtzT6oISZZFX8ieszHZiiVSZaDW
 O7NhexwibxDs+X2aUAIq7ICL+C4B5g==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911fe28 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=33HcGjt8BaiwP3wcfBYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Cje320Z0g2K7pdkC242BhYqBghy0OLum
X-Proofpoint-GUID: Cje320Z0g2K7pdkC242BhYqBghy0OLum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_070057_397009_F13A3CC1 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 4c740c4d8bac5569c5bf5f86db65ce779178f9a2:

  Merge tag 'ath-current-20251103' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2025-11-05 16:18:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251110

for you to fetch changes up to 9065b968752334f972e0d48e50c4463a172fc2a7:

  wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp() (2025-11-06 07:26:21 -0800)

----------------------------------------------------------------
ath.git update for v6.18-rc6

Fix an ath11k transmit status reporting issue. This issue has always
been present, but not reported until recently.

Bringing this through the current release since there is now a
userspace entity that wants to leverage this.

----------------------------------------------------------------
Nicolas Escande (1):
      wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp()

 drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

