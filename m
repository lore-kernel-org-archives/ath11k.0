Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE3C83F2D
	for <ath11k@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90GpV8+hUwlfdrE85xu/G/2AfYKG3ln+ooGRMjQFTQI=; b=Yc3p9J/v3WfJ2gKleSGm5JZKQ4
	AWYE9XdZqZ2cEC3lvKZOmwQsaF6GSHQ+txvT/vURCJAmRzm23n2NbBwaIDBuDVjIpnem9BZepzjAL
	H9w51N61MipxBYbWHPbLx2GrvTY3SpfBRSO8BOtCF+dBjmetmvhnMxRPi+xWlNta9mEohSjlzIICr
	s8d6ZZNqyZvzwGjzbKOZKNXUTQ+tKWJdJjuSIGROkWBj+5cI1dTdpY8Ak/j2tP66W+0hta8AqX3De
	NR1jMh6LZmBfZFg3OMybjHi4Thm4vCwIa5exuGFQs9Ov78DCBztZO0wE4APkr9sDRlIWjAEW7DYrd
	hAiAE7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBd-000000061gS-0qcB;
	Tue, 15 Jul 2025 19:19:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubj4G-00000005nTi-3DWr
	for ath11k@lists.infradead.org;
	Tue, 15 Jul 2025 17:03:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDQQ8014553
	for <ath11k@lists.infradead.org>; Tue, 15 Jul 2025 17:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90GpV8+hUwlfdrE85xu/G/2AfYKG3ln+ooGRMjQFTQI=; b=XUHQzie5MoNqwmRZ
	LEjEvfT5o7uDvBOnW2CgImO7Q56a+i5SNOUEKJCmWjRKvlfV4m6Pv9b/I/7ZWpMD
	0GQpLkMI46EoOqou9u/rnzUfmCAPUwiIMiQIPrViTsxVyUj4vvo5EUtFv792PUbF
	NFkn6CkYc6xO8x1GpYuCHWUw4H7w5wd4GjFnJA4c5MM44q6zK96U6X/K9udNeBiz
	UCcXmhBYaIaJqh73jtHsj7RPjKcT2mpVDq3eoLzD+j8mOg/22jc1DvKi9XAUam8S
	UUHz9NZvOeSTWsp7EJolVr6rZ6f8syqQTRW3phQm3c07bG7kP0Gv9Ss7uoi07RHk
	KanEWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dykwhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 15 Jul 2025 17:03:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23494a515e3so50122165ad.2
        for <ath11k@lists.infradead.org>; Tue, 15 Jul 2025 10:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752599026; x=1753203826;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90GpV8+hUwlfdrE85xu/G/2AfYKG3ln+ooGRMjQFTQI=;
        b=B2PWtVxWm4FL7RnSJcF79/e8ofH7pR1Nc+3RzsT+IKtsIFR58j0zXwSi+x/ZhpTmSK
         W8TIbpbCuOv3i31tQjpOx40BMqemk+7VdjcGTpcI0uIfi1vLHDQRLJjSCO1ArFIz/8nR
         v7aQ4bjxe/1/kJ5fnDELjVN23keFiPMvUGHjS7PmqPMSSPv0FlwGtj9cD/rxgkzo4859
         NLMX25vo8Nc9ESzNlzMkiNKIX9TDWMUDjKBdP5ZOlIZQYlQexJ7xxHAgKNf/KMzALLyK
         X261j3C5rNvuOfQM9OP/Ts+H4Z/Sagkomq0IiUGBVq1krSsCGKs9LWkxMVCQwN+aM4zC
         qUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI04mSlStCkuPpZtRXVxpnHkB2baa+kTSyJw/VbBJ7n8nRDevKrIo56bh5M3ahAAg7PhlDPFQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqt4CSdLWnKN49VWaRrfwHxACFN6FZMUYoTxDtjLWaYY7pHsLD
	i8TBOVXPu9hhfFnDESGXbyiy31SAXPiqrBSy3zuZilW3Wb+QaoludFn3UOX1hOTccMFCcB5TlU7
	Wpeo0Hx2aWZnH8JxujyC0OP+65gyOy3HtjSAq+X3Z6lB96gNmpN7FUbiI/XoZVuiUWxc3PxeC
X-Gm-Gg: ASbGncsbdmKz3egvYFFvhaT7HjrwwOoRlg7ebuAokXMJWAYI1J0lYCzr7Ng8H25VXMA
	c/X+TquXuznulJ09E7eH/+u5RTKq+BVgxgzlfQVHjb6VtZOecbHZW7bp6fSKV5oN+c3+fTUT+Hw
	+UF0AJtpYZuBz+9PbY7+6A2qn4YMviE+Dtgv8ZyJxbdyeq4pX6nX/nwdrlvpqUNQQp1szIsU+Ip
	QzFwkfARffCJr82VeZZ0kQmt1ksoxitQvyvVwavQUHRXQ8gmONctubjFFOdg8OcnJE986VKn12a
	q+qu8Vh96AbkgIAG+pJZ5fNs/3ME4o0s2LmQlHFFKcT3rP4pF+Meh1/Y43NdzEm0V5Co+b+KhCw
	+
X-Received: by 2002:a17:903:1448:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-23df07da8b3mr303638905ad.1.1752599025812;
        Tue, 15 Jul 2025 10:03:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+5ygamHAh1vx+QECJOZ2mYRZ3B1D8qXh5iQiUIr+MN993YDsA1qSa7iS48ILhmJyiSBMqUQ==
X-Received: by 2002:a17:903:1448:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-23df07da8b3mr303638435ad.1.1752599025297;
        Tue, 15 Jul 2025 10:03:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322cbcsm118733715ad.137.2025.07.15.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:03:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250603-ath11k-use-non-atomic-iterator-v1-1-d75762068d56@quicinc.com>
References: <20250603-ath11k-use-non-atomic-iterator-v1-1-d75762068d56@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: fix sleeping-in-atomic in
 ath11k_mac_op_set_bitrate_mask()
Message-Id: <175259902445.3668196.7323548526989354054.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:03:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: nVBk12bm3xO-2pVekYrumdZjBzVC7s8P
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687689f2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=MkI95_h35qG_dB8Vl04A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE1NiBTYWx0ZWRfXwnWpIiiJcWMU
 VlSnlPDlFuX7somkDkCUo6NLJein5NhlWUfqTLzzySQYA/tYQCQf4P1iPK5M0YI5T07m6M2EyMH
 KGqmiJqc8elUZd+rWPPlUtckzihVEB98UdSFbWwGUpiHZRXrDR2IL3U6XC+qSAvYmbJ/lIxZ+z+
 SFU/3Cuhv6o9pyNw6nARwosTtDYkDVv4dltAgfUpbjEGkFJlKpzNiWPNkPSGDhL6Mxo72zvKzVk
 2/lkz03jivu/PuSLeLON0p0+e5UkYaqQSbpTlQrXBXHdKs+WBsPSnlgp7NN3WKKhivcRwYbkRZL
 Ad9vhXa/GtQ66bW+7kW+c1RC8inqFboUKtGevyOWvIj76uWEQ53eYtaXRJsui5PpJ2M0lLNgjD8
 /rPbhhlcf8IpOLaJ//uNX3p2uITeJBAJnE+D3VrV+e2p9+aTRTwnMEtyetjQ0ueE9wEv3LLr
X-Proofpoint-GUID: nVBk12bm3xO-2pVekYrumdZjBzVC7s8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=862
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_100348_827171_2399DBDC 
X-CRM114-Status: GOOD (  10.58  )
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


On Tue, 03 Jun 2025 10:25:28 +0800, Baochen Qiang wrote:
> ath11k_mac_disable_peer_fixed_rate() is passed as the iterator to
> ieee80211_iterate_stations_atomic(). Note in this case the iterator is
> required to be atomic, however ath11k_mac_disable_peer_fixed_rate() does
> not follow it as it might sleep. Consequently below warning is seen:
> 
> BUG: sleeping function called from invalid context at wmi.c:304
> Call Trace:
>  <TASK>
>  dump_stack_lvl
>  __might_resched.cold
>  ath11k_wmi_cmd_send
>  ath11k_wmi_set_peer_param
>  ath11k_mac_disable_peer_fixed_rate
>  ieee80211_iterate_stations_atomic
>  ath11k_mac_op_set_bitrate_mask.cold
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix sleeping-in-atomic in ath11k_mac_op_set_bitrate_mask()
      commit: 65c12b104cb942d588a1a093acc4537fb3d3b129

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


