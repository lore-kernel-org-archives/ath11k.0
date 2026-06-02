Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE310CD6E60
	for <ath11k@archiver.kernel.org>; Tue,  2 Jun 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=; b=wNgXElg+FHbSINxoby1T+Mi6w/
	jO/Im0JiIy+lu7vjcJU9lWv2zAzRpdFRA4sERyf+60C3piGZXiiBym2S0Z5kp4qJqF/6AvuXW54fY
	ndbpuhU5GTt0N1OXF25RfTlkEC1/ldDOFnXhsVmh5ZA3qSd545PXukCZw7PE7F/3dHsvB+odwNSTp
	EPW0wRqI6fN0ZHf84iU2FX6k1aoiGraenD8ZIIPtd4eScDY1QKJ7bo5gZNwvVM+eoG+nK8T1+onIX
	X0ZVLtaBMquOkyepXG0FSnvbyoz4u7FnJLbCvcWb0Zh5we5pJgKn0H4teyot5UaNZYc3BuFHhW2lY
	LCgG5/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSdC-0000000DYKf-0JyM;
	Tue, 02 Jun 2026 17:10:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSd9-0000000DYJq-3RHx
	for ath11k@lists.infradead.org;
	Tue, 02 Jun 2026 17:10:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EB8vw1638469
	for <ath11k@lists.infradead.org>; Tue, 2 Jun 2026 17:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=; b=RvGqCcDNYtozPEiS
	CYLS/1v9wUP7ra0dhlJpkOOhOO9laDsk8pM9hPeXxK2WSDfiJHmrX7eFDeIFjW3R
	Vgw8CYBJaPcJFi2nEQU4j38RE6pFJj87Loajsn/11q7Ti2dR1likcCeJs92naRtY
	Q9lv2IuUqBxXxgwp9gDI3i2H/qdn7wzTWmWW3xr1EQ423C8Rhv+53dkRve0d+xBy
	Eph0XrYHFm+6BXqeZQAtX0KWK+FIA4NgaCjGLSZikyRuE6b9oDJ1jbk1D0Ec7M5C
	CcRXcOkAQDdJZe/GvFazntD3eFruKEWa6xGnpg/FtEAdzmtYkc9uy+3qxq4zvwAT
	RUqbOQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1cjc21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 17:10:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304efad654dso200528eec.1
        for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780420217; x=1781025017; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=;
        b=H7lmTUlXBol0pM+UiFPqhs3nQHfdN7vil6lp0MvvsiDlMuSZrXjluZwAJu3oRtRfkV
         AcEVB5GHM0Pr0h3Ip74OoswsJl4ykzJ5Hv6V2N05RQUycjIHfeqFED8TOsE6m3M3xzSc
         eVLle1ETjbijY4sCNcPLjwoPJLkmU4K2Ah9MB1FTZpAXp71n+AqtSCcDGBcK89fohimT
         1ffUamt244LxXurWm3myvsHMOY0kw8LbaRm2q4vPuDbBBPGdQdfweOQCYyqrhaTYcysz
         LwIMYDWipmmbXc9TYunPMArH7Ya/EqErnIt5i8VmhEXGjeRhJL1lrS1DajNnlEv2CE8l
         9RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780420217; x=1781025017;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=;
        b=hRWODBzeKNH0zh3EoLhOQJrCXn5Gfgkq9V23HUf13otQpih/IwiXmlaTTznH4FqqOD
         isHh8hEqvQG2grfkG4jL8PsDGZehZ4jJVskDMK3aUBg6jgnC5Ynm0B5vXe/88QuqQoxG
         eeCjCh6Jf49MGoGQZ5dS1jN3Sj7J0hh1mUPUHg4hgrr0YtU93zRpK39AxsDkJ7euyROF
         wmC09e5BqJCxe8zmouD0nV+j21R3wyv4dqtDs7LcNVVimamloVRWcJfk132dafrhxtZh
         ll55fUL5kWBIpllWJ9Wv+e9sGPyKLRcuoqNj16GyVCv1Rq/gscqq4+wWcoW57/M9YTjW
         rywg==
X-Forwarded-Encrypted: i=1; AFNElJ/dVzeyBvR6KRBLDgOZrJUmbwkwKxUuSI/diQGaytg2CbNT1j03jxVA9FXL9gomWDzP5lqoKCg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJe8IYU5IkAB3dmq6O9mFA7otEDQASQkj24dQrRvC1yfRQIf/W
	LIpjVnACsXorneAiSDucgcMv1INZBjSDCSuUzEBBIXbhxIuZCxTOFPxrPuJ8wANCgttLbWQ7ulM
	22wpo+sz1WVW0VshMGeY5GTyMU7wUnEuTyb6pxcEONG5U5C3qChtPhZ3nWcwOwOlj
X-Gm-Gg: Acq92OGZfm519B7wuNmBEOFUo5plCx4b0Uj8djG4ho1rSs5gKE4gd0smcUHGFRip5xN
	0qY2twnz5g1lr5EfbcuBUyRmK+5BMbr7k5oWuVdNT9qgUPOlyY4T6l+vCocM8TWXe+rp1fswpRx
	/0jrO+PKlaiFUBqBqmTktwnfZ5LXpj2b4IxnMwpSYiRQDabLrUVPeZKMaUEEOBWEbxPMeCbJpNk
	ofE+PmmzHAd+y7B1qPKsIKpfpgAgPxYJ98z9qI1oq4l5kNoWXdKI+ZzjWuaUaDNmlGsXe4fNlaG
	nTpuOmP1A3JCOB3/fSAEyM2zJCbRqbkR5gfufAGn4hp9qu5bJLGxpoM0JYY8fAYhLIHkd4YDCRn
	5VgWvMyMxBEUMfXbUMZxI0qzzv/Zj00dS2X4WLClUOFgyVR7iwpjxF0p5OAx6ltWmX3ElzqxtHk
	M5bPNeXVzE4Dk/UMpSDUpx/cZN
X-Received: by 2002:a05:7300:ef83:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304fa74682bmr8020150eec.33.1780420216457;
        Tue, 02 Jun 2026 10:10:16 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304fa74682bmr8020119eec.33.1780420215911;
        Tue, 02 Jun 2026 10:10:15 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm12470560eec.18.2026.06.02.10.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 10:10:15 -0700 (PDT)
Message-ID: <dc836218-2f18-4465-882c-c41b5289c379@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:10:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] PCI: Add device-specific reset for Qualcomm
 devices
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
        alex@shazbot.org
Cc: jjohnson@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260602160024.1171949-1-jtornosm@redhat.com>
 <20260602160024.1171949-3-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260602160024.1171949-3-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hriehxOz3rvUgFkPRsU-sjWYjAQ9mzaj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2NSBTYWx0ZWRfX5zNNzc+Hn/n7
 zmE5xXd+s5g5pijAzwSKwdQzszJH3SnGxuKL0Rnum+vZsa1oPjcR2XFtkdKAE42H9L6YVm5NpFU
 lhNO5CZwqoWGlOP40YX+IKFAtFPh4SoO7NbEI6qZ/xtbIhLPhPbuvgL1dj9jbmZhgobYN5sBV7m
 YQRWZP1gcS/CfhM4xFHkcRgxIxvwyCaaMW6cmRRG2kBiWEAFmp3av/VqIy6QXOhL0K3ZGzfETzg
 joGOaFJZCb84CCC6ogwNSNNxwB3ohUe4yvdPm6SBdS6bePGaRrKacF42TdY/kkpllGWbR2mBPfm
 d/5B1PKsW4UgUQ6nnVvbKbygXzHSovmgscAo82UVB/7ZdY2r0+N387sdBOlKRGpeN+CqSxGTO5S
 S+Pf1qj+slJYqbepS7C12bZj89YwlUeoB41BaE3TLmEKsFFx2fE0/KQ0LLIKKaQ/ugUkv/JBfjE
 IYgGP7arWnAbXJpJOhg==
X-Proofpoint-GUID: hriehxOz3rvUgFkPRsU-sjWYjAQ9mzaj
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1f0e79 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_dsfnS01iu48ROCZzqsA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_101019_971399_28730DF9 
X-CRM114-Status: GOOD (  15.20  )
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

On 6/2/2026 9:00 AM, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (ath11k WiFi, ath12k WiFi, SDX62/SDX65 modems)

Throughout your series you refer to ath11k and ath12k as if they are devices.
They are not. They are device drivers, each of which supports a large number
of devices.

> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> The problem manifests in VFIO passthrough scenarios:
> 
> - ath11k WiFi (17cb:1103): Normal VM operation works fine, including

17cb:1103 is WCN6855

>   clean shutdown/reboot. However, when the VM terminates uncleanly
>   (crash, force-off), VFIO attempts to reset the device before it can
>   be assigned to another VM. Without a working reset method, the device
>   remains in an undefined state, preventing reuse.
> 
> - ath12k WiFi (17cb:1107): Same behavior as ath11k.

17cb:1107 is WCN7850

> 
> - SDX62/SDX65 5G modems (17cb:0308): Never successfully initialize even
>   on first VM assignment without proper reset capability.
...

> @@ -4252,6 +4268,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  		reset_chelsio_generic_dev },
>  	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
>  		reset_hinic_vf_dev },
> +	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_d3cold_d3hot },  /* ath11k */

s/ath11k/WCN6855/

> +	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_d3cold_d3hot },  /* ath12k */

s/ath12k/WCN7850/

> +	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_d3cold_d3hot },  /* SDX62/SDX65 */
>  	{ 0 }
>  };
>  

same guidance applies to the 3/3 patch

/jeff

