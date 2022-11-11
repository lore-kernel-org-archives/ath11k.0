Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B92C433FE
	for <ath11k@archiver.kernel.org>; Fri, 11 Nov 2022 20:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmVPifgKDxtpG901k+PdBTWtzxED7sXBfBxblZXaOvU=; b=AFfdiMci1/qoU+
	yTu1aqKq8W6eP4OK688BA411GznqenDqzrpAnf/WiDm3YKh5xNDwPz05E154Mvt9hRPmlH39r0IrO
	5+g0krzcdTDYMdaIxz6TSbpODsRzXSWVhVunOisjfQqydlMVKS9lQUttEQfx7tuChrkabOBr+Rl1L
	vIPIJNN88Os9PzduLKCgpvzFxcYVce3AROHFUK1yFbp+YvqZMGbU7jspzycM7QO60OFEiMbdE1BuA
	+xriuv43U6ijO50ExnFVPy1wlQFlVYyK0D0NLtEL2/VmEueVZAk14camnRfVa+fX13xJafIB5QTxc
	GtVTKUXQpMMBRhTUtX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaYV-000tVC-Bc; Fri, 11 Nov 2022 20:23:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaYR-000tSX-C2
	for ath11k@lists.infradead.org; Fri, 11 Nov 2022 20:23:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3354B827C4;
	Fri, 11 Nov 2022 20:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA5BC433C1;
	Fri, 11 Nov 2022 20:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668198185;
	bh=BZ3wyxxZdgDINkYNyuOux0Zc7w4PhGA38LooBwIf42M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZt6Z3bYaSN35WFi1o+3UHUz3D5JSMfYCf14FxThFASoCci48EeQHM+DGNzAooKW0
	 YKD9UFJv1LUKheQLsmPBRNjuAQSEBTRQqjR6m2gvh+equbgF9MjTL8wQDIH4PYRBqg
	 vxXzOCIrkZdMOzaa6RdMJpID1GKy4OZIkwIJmzOiaE+jz+pH7QnBD+48IVZDUdemrR
	 bzD36OANSok99zQpVD8RmZJT4bpUWRQuZARimjOhYtaBbIz4IEBFVbIOiErzEhuH/c
	 i9L2VNS/ek3pZmtr0LCuIv1hkzhPGLj/scph2M8E0K8eU2LY9p8n6C36PKqK28T0sw
	 lsPrUGMS4YV0A==
Date: Fri, 11 Nov 2022 14:23:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mpubbise@quicinc.com,
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] wifi: ath10k: Add WLAN firmware image version info
 into smem
Message-ID: <20221111202302.nbzu53hir2azdb4o@builder.lan>
References: <20221111114235.10287-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111114235.10287-1-quic_youghand@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_122312_015030_529583D6 
X-CRM114-Status: GOOD (  35.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Nov 11, 2022 at 05:12:35PM +0530, Youghandhar Chintala wrote:

Can you please change the subject to:
wifi: ath10k: Store WLAN firmware version in SMEM image table

> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
> 
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
> 
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
> 
> This change is applicable only for WCN399X targets.
> 

Why is this restricted to WCN399X? Is it not the case that it only
relates to the SNOC/QMI-based implementation? Perhaps that's the same
thing, but if so I think the comment could be improved.

> Example:
> cat /sys/kernel/debug/qcom_socinfo/cnss/name
> QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Reported-by: kernel test robot <lkp@intel.com>

I don't think that kernel test robot reported the lack of this feature.

> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
> Changes from v2:
>  - Removed blank line between trailers
>  - Changed memcpy to strscpy
>  - Removed version_string_size
>  - Added new condition fw_build_id against max length
>  - Added depends on QCOM_SMEM for ath10k_snoc
> ---
>  drivers/net/wireless/ath/ath10k/Kconfig |  1 +
>  drivers/net/wireless/ath/ath10k/qmi.c   | 34 +++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
> index ca007b800f75..e6ea884cafc1 100644
> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -44,6 +44,7 @@ config ATH10K_SNOC
>  	tristate "Qualcomm ath10k SNOC support"
>  	depends on ATH10K
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SMEM
>  	select QCOM_SCM
>  	select QCOM_QMI_HELPERS
>  	help
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 66cb7a1e628a..6c3ddad26417 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/net.h>
>  #include <linux/platform_device.h>
>  #include <linux/qcom_scm.h>
> +#include <linux/soc/qcom/smem.h>
>  #include <linux/string.h>
>  #include <net/sock.h>
>  
> @@ -22,6 +23,8 @@
>  
>  #define ATH10K_QMI_CLIENT_ID		0x4b4e454c
>  #define ATH10K_QMI_TIMEOUT		30
> +#define ATH10K_SMEM_IMAGE_VERSION_TABLE       469

This isn't the ATH10K SMEM_IMAGE_VERSION_TABLE, it's the one and only
SMEM_IMAGE_VERSION_TABLE. As that is defined in socinfo.c, you can
use the same define here.

> +#define ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX     13

SMEM_IMAGE_TABLE_CNSS_INDEX

>  
>  static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
>  					 struct ath10k_msa_mem_info *mem_info)
> @@ -536,6 +539,35 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar)
>  	return ath10k_qmi_mode_send_sync_msg(ar, QMI_WLFW_OFF_V01);
>  }
>  
> +static void ath10k_qmi_add_wlan_ver_smem(struct ath10k *ar, const char *fw_build_id)
> +{
> +	u8 *smem_table_ptr;

I don't think "smem" or "ptr" adds any value in this variable name.
"table" should be sufficient.

> +	size_t smem_block_size;

This is the "smem_item_size".

> +	const u32 smem_img_idx_wlan = ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX * 128;

Why not just "offset"?

#define SMEM_IMAGE_VERSION_ENTRY_SIZE 128

Instead of writing 128 here and abusing MAX_BUILD_ID_LEN below.

> +
> +	smem_table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +				       ATH10K_SMEM_IMAGE_VERSION_TABLE,
> +				       &smem_block_size);
> +	if (IS_ERR(smem_table_ptr)) {
> +		ath10k_dbg(ar, ATH10K_DBG_QMI,
> +			   "smem image version table not found\n");
> +		return;
> +	}
> +
> +	if (smem_img_idx_wlan + MAX_BUILD_ID_LEN > smem_block_size) {
> +		ath10k_dbg(ar, ATH10K_DBG_QMI, "smem block size too small: %zu\n",
> +			   smem_block_size);

You found a IMAGE_VERSION_TABLE, but it's smaller than expected. That
sounds like an ath10k_err() to me.

> +		return;
> +	}
> +
> +	if (strlen(fw_build_id) > MAX_BUILD_ID_LEN) {

Is this really a concern, if the string is too long strscpy() below will
truncate it.

> +		ath10k_dbg(ar, ATH10K_DBG_QMI, "fw_build_id length more than max length\n");
> +		return;
> +	}
> +
> +	strscpy(smem_table_ptr + smem_img_idx_wlan, fw_build_id, MAX_BUILD_ID_LEN);

MAX_BUILD_ID_LEN is the length of fw_build_id, which is 128.

But the memory you're writing to is defined as:

struct smem_image_version {
	char name[SMEM_IMAGE_VERSION_NAME_SIZE];
	char variant[SMEM_IMAGE_VERSION_VARIANT_SIZE];
	char pad;
	char oem[SMEM_IMAGE_VERSION_OEM_SIZE];
};

With SMEM_IMAGE_VERSION_NAME_SIZE being 75.

> +}
> +
>  static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  {
>  	struct wlfw_cap_resp_msg_v01 *resp;
> @@ -606,6 +638,8 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  			    qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);
>  	}
>  
> +	ath10k_qmi_add_wlan_ver_smem(ar, qmi->fw_build_id);

qmi->fw_build_id is only valid if resp->fw_build_id_valid is set...

Regards,
Bjorn

> +
>  	kfree(resp);
>  	return 0;
>  
> -- 
> 2.38.0
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
